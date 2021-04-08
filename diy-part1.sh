#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

#cd   target/linux/ar71xx/image
cp target/linux/ar71xx/image/legacy.mk target/linux/ar71xx/image/legacy.mk.bak
ubi=110592
firmware=112640
sed -i "s/\(^wndr4300_mtdlayout.*\)23552k\(.ubi..\)25600k\(.*$\)/\1${ubi}k\2${firmware}k\3/" target/linux/ar71xx/image/legacy.mk
#diff -u0 legacy.mk.bak legacy.mk


#cd lede/package/lean
git clone https://github.com/kenzok8/openwrt-packages.git package/lean/
git clone https://github.com/kenzok8/small.git package/lean/

