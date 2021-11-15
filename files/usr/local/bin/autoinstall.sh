#!/usr/bin/env bash

IMG='https://cdimage.ubuntu.com/releases/20.04.3/release/ubuntu-20.04.3-preinstalled-server-arm64+raspi.img.xz'
curl "${IMG}" | xz -dc | dd of=/dev/mmcblk0

mount /dev/mmcblk0p2 /mnt

URL=$(get_opt_224.sh)
curl ${URL} > /mnt/etc/netplan/eth0.yaml
echo 'network: {config:disabled}' > /mnt/etc/cloud/cloud.cfg.d/99-disable-network-config.cfg

sync && umount /mnt
