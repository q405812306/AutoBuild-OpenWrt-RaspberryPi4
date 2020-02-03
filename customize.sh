#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
#=================================================

#添加自定义组件
rm -rf ./openwrt/package/lean/luci-app-ssr-plus
git clone https://github.com/xsm1997/openwrt-kumasocks.git ./openwrt/package/openwrt-kumasocks
git clone https://github.com/xsm1997/luci-app-ssr-plus.git ./openwrt/package/luci-app-ssr-plus
git clone https://github.com/sypopo/luci-theme-atmaterial.git ./openwrt/package/lean/luci-theme-atmaterial
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git ./openwrt/package/luci-app-adguardhome
git clone https://github.com/sypopo/luci-theme-argon-mc.git ./openwrt/package/luci-theme-argon-mc
git clone https://github.com/rufengsuixing/luci-app-onliner.git ./openwrt/package/luci-app-onliner
git clone https://github.com/lisaac/luci-app-diskman ./openwrt/package/luci-app-diskman
mkdir -p ./openwrt/package/parted && cp -i ./openwrt/package/luci-app-diskman/Parted.Makefile ./openwrt/package/parted/Makefile

#修复核心及添加温度显示
sed -i 's|pcdata(boardinfo.system or "?")|luci.sys.exec("uname -m") or "?"|g' openwrt/feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
sed -i 's/or "1"%>/or "1"%> ( <%=luci.sys.exec("expr `cat \/sys\/class\/thermal\/thermal_zone0\/temp` \/ 1000") or "?"%> \&#8451; ) /g' openwrt/feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

#修复docker桥接问题
sed -i '$a\net.bridge.bridge-nf-call-ip6tables = 1' openwrt/package/base-files/files/etc/sysctl.conf
sed -i '$a\net.bridge.bridge-nf-call-iptables = 1' openwrt/package/base-files/files/etc/sysctl.conf
sed -i '$a\net.bridge.bridge-nf-call-arptables = 1' openwrt/package/base-files/files/etc/sysctl.conf

#默认开启wifi并配置网口
mkdir -p openwrt/files/etc/config
cp -f wireless ./openwrt/files/etc/config/wireless

#修改机器名称
sed -i 's/OpenWrt/RaspberryPi4/g' openwrt/package/base-files/files/bin/config_generate

#替换banner
rm -rf openwrt/package/base-files/files/etc/banner
cp -f banner openwrt/package/base-files/files/etc/
