#!/bin/bash -eux
echo "Cleanup the system"

# delete yum caches
dnf -y clean all

# delete temporary files
rm -rf /tmp/*
rm -rf /var/tmp/*

# clean logs
echo -n | tee /var/log/yum.log

# clean network settings
rm -rf /etc/udev/rules.d/70-persistent-net.rules

# zero out the free space to save space in the final image
dd if=/dev/zero of=/EMPTY bs=1M | true
rm -f /EMPTY

# block until the empty file has been removed, otherwise, Packer will try to
# kill the box while the disk is still full and that's bad
sync
