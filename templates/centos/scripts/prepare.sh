#!/bin/bash -eux
echo "Prepare System"

# Fix 'Predictable Network Interface Names'
# ARPCHECK=no /sbin/ifup eth1 2> /dev/null
# ERROR: [/etc/sysconfig/network-scripts/ifup-eth]
#   Device eth1 does not seem to be present, delaying initialization.
ln -s /dev/null /etc/udev/rules.d/80-net-name-slot.rules
