#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================

#添加自定义组件
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git ./openwrt/package/luci-app-adguardhome
git clone https://github.com/sypopo/luci-theme-argon-mc.git ./openwrt/package/luci-theme-argon-mc
git clone https://github.com/rufengsuixing/luci-app-onliner.git ./openwrt/package/luci-app-onliner
git clone https://github.com/lisaac/luci-app-diskman ./openwrt/package/luci-app-diskman
mkdir -p ./openwrt/package/parted && cp -i ./openwrt/package/luci-app-diskman/Parted.Makefile ./openwrt/package/parted/Makefile

#修复核心及添加温度显示
sed -i 's|pcdata(boardinfo.system or "?")|luci.sys.exec("uname -m") or "?"|g' openwrt/feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
sed -i 's/or "1"%>/or "1"%> ( <%=luci.sys.exec("expr `cat \/sys\/class\/thermal\/thermal_zone0\/temp` \/ 1000") or "?"%> \&#8451; ) /g' openwrt/feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm

#默认开启wifi
mkdir -p ./openwrt/files/etc/config && cp -i wireless ./openwrt/files/etc/config/wireless
