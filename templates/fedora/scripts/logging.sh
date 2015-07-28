#!/bin/bash -eux
echo "Log some information"

# system version
cat /etc/system-release

# kernal version
uname -a

# installed kernals
rpm -qa kernel

# list installed packages
rpm -qa --qf "%{NAME}-%{VERSION}-%{RELEASE}.%{ARCH}\n"

# package count
dnf list installed | wc -l
