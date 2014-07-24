#!/bin/bash -eux
echo "Cleanup the system"

# clean device specifics
rm -rf /dev/.udev/
sed -i "/^HWADDR/d" /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i "/^UUID/d" /etc/sysconfig/network-scripts/ifcfg-eth0

# delete yum caches
yum -y clean all

# delete temporary files
rm -rf /tmp/*
rm -rf /var/tmp/*

# clean logs
rm -f /var/log/anaconda.*
rm -f /var/log/dmesg.old
echo -n | tee /var/log/boot.log /var/log/cron /var/log/dmesg /var/log/lastlog \
              /var/log/maillog /var/log/messages /var/log/secure /var/log/yum.log

# zero out the free space to save space in the final image
dd if=/dev/zero of=/EMPTY bs=1M | true
rm -f /EMPTY

# block until the empty file has been removed, otherwise, Packer will try to
# kill the box while the disk is still full and that's bad
sync
