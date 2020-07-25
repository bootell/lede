#!/bin/bash

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# Modify default router name
sed -i '/^exit 0/i\uci set system.@system[0].hostname=Brooks-Router' package/lean/default-settings/files/zzz-default-settings

# Modify password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./$1$uT7VOTNn$Jw1PH9fCQohqKHaXs01Z71/g' package/lean/default-settings/files/zzz-default-settings

# Add zzuli ipset
sed -i '/^exit 0/i\sed -i "$i\\ipset create zzuli hash:ip family inet\\n" \/etc\/rc.local' package/lean/default-settings/files/zzz-default-settings
sed -i '/^exit 0/i\echo "conf-dir=\/etc\/dnsmasq.d" >> \/etc\/dnsmasq.conf' package/lean/default-settings/files/zzz-default-settings

# free ssr
sed -i '/^exit 0/i\echo 0xDEADBEEF > \/etc\/config\/google_fu_mode' package/lean/default-settings/files/zzz-default-settings

# Replace wifi driver
# rm -f package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin
# curl -fsSl -o package/lean/k3-brcmfmac4366c-firmware/files/lib/firmware/brcm/brcmfmac4366c-pcie.bin https://raw.githubusercontent.com/Hill-98/phicommk3-firmware/master/brcmfmac4366c-pcie.bin.69027

# Optimize build size
sed -i 's|^TARGET_|# TARGET_|g; s|# TARGET_DEVICES += phicomm-k3|TARGET_DEVICES += phicomm-k3|' target/linux/bcm53xx/image/Makefile
