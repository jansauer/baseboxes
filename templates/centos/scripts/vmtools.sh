#!/bin/bash -eux
echo "Installing VirtualBox guest additions"

# install dependencies
yum install -y bzip2 perl gcc kernel-headers kernel-devel

# mount guest additions
VBOX_VERSION=$(cat /etc/vbox_version)
mount -o loop,ro /root/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt

# run the installer
# need to ignorre exit code since it always fails.
# virtualbox: Installing the Window System drivers       [FEHLGESCHLAGEN]
# virtualbox: (Could not find the X.Org or XFree86 Window System.)
sh /mnt/VBoxLinuxAdditions.run --nox11
# || true

# unmount guest additions
umount /mnt
rm -rf /root/VBoxGuestAdditions_$VBOX_VERSION.iso

# remove dependencies
yum erase -y bzip2 perl gcc kernel-headers kernel-devel cpp libmpc mpfr

# remove logs
rm -f /var/log/vboxadd-install.log
rm -f /var/log/vboxadd-install-x11.log
rm -f /var/log/VBoxGuestAdditions.log
