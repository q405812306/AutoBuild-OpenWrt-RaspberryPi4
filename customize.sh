#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================

#添加lienol的openwrt源
sed -i '$a\src-git lienol https:\/\/github.com\/Lienol\/openwrt-package' openwrt/feeds.conf.default
./openwrt/scripts/feeds clean
./openwrt/scripts/feeds update -a
rm -rf openwrt/feeds/lienol/lienol/v2ray
rm -rf openwrt/feeds/lienol/lienol/openssl1.1
rm -rf openwrt/feeds/lienol/lienol/trojan
rm -rf openwrt/feeds/lienol/lienol/ipt2socks
rm -rf openwrt/feeds/lienol/lienol/shadowsocks-libev-new
rm -rf openwrt/feeds/lienol/lienol/shadowsocksr-libev
rm -rf openwrt/feeds/lienol/lienol/pdnsd-alt
rm -rf openwrt/feeds/lienol/package/verysync
rm -rf openwrt/feeds/lienol/lienol/luci-app-verysync
rm -rf openwrt/package/lean/kcptun
rm -rf openwrt/package/lean/luci-app-kodexplorer
rm -rf openwrt/package/lean/luci-app-pppoe-relay
rm -rf openwrt/package/lean/luci-app-pptp-server
rm -rf openwrt/package/lean/luci-app-v2ray-server
./openwrt/scripts/feeds install -a

#添加其他package
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git
git clone https://github.com/lisaac/luci-lib-docker.git openwrt/package/luci-lib-docker
git clone https://github.com/lisaac/luci-app-dockerman.git openwrt/package/luci-app-dockerman
git clone https://github.com/sypopo/luci-theme-argon-mc.git openwrt/package/luci-theme-argon-mc
git clone https://github.com/rufengsuixing/luci-app-onliner.git openwrt/package/luci-app-onliner
