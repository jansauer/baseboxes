#!/bin/bash -eux
echo "Prepare for Ansible"

# needed to run the ansible dnf module
dnf install -y  yum-utils
