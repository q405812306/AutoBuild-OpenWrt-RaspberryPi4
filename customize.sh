#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================

#添加lienol的openwrt源
sed -i '$a\src-git lienol https://github.com/Lienol/openwrt-package' openwrt/feeds.conf.default
./scripts/feeds clean
./scripts/feeds update -a
rm -rf feeds/lienol/lienol/v2ray
rm -rf feeds/lienol/lienol/openssl1.1
rm -rf feeds/lienol/lienol/trojan
rm -rf feeds/lienol/lienol/ipt2socks
rm -rf feeds/lienol/lienol/shadowsocks-libev-new
rm -rf feeds/lienol/lienol/shadowsocksr-libev
rm -rf feeds/lienol/lienol/pdnsd-alt
rm -rf feeds/lienol/package/verysync
rm -rf feeds/lienol/lienol/luci-app-verysync
rm -rf package/lean/kcptun
rm -rf package/lean/luci-app-kodexplorer
rm -rf package/lean/luci-app-pppoe-relay
rm -rf package/lean/luci-app-pptp-server
rm -rf package/lean/luci-app-v2ray-server
./scripts/feeds install -a

#添加其他package
git clone https://github.com/lisaac/luci-lib-docker.git openwrt/package/luci-lib-docker
git clone https://github.com/lisaac/luci-app-dockerman.git openwrt/package/luci-app-dockerman
git clone https://github.com/sypopo/luci-theme-argon-mc.git openwrt/package/luci-theme-argon-mc
git clone https://github.com/rufengsuixing/luci-app-onliner.git openwrt/package/luci-app-onliner
