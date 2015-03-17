#!/bin/bash -eux
echo "Installing VirtualBox guest additions"

# install dependencies
yum install -y bzip2 perl gcc kernel-headers kernel-devel

# mount guest additions
VBOX_VERSION=$(cat /etc/vbox_version)
mount -o loop,ro /root/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt

# run the installer
sh /mnt/VBoxLinuxAdditions.run --nox11

# unmount guest additions
umount /mnt
rm -rf /root/VBoxGuestAdditions_$VBOX_VERSION.iso

# remove dependencies
yum erase -y bzip2 perl gcc kernel-headers kernel-devel cpp libmpc mpfr

# remove logs
rm -f /var/log/vboxadd-install.log
rm -f /var/log/vboxadd-install-x11.log
rm -f /var/log/VBoxGuestAdditions.log
