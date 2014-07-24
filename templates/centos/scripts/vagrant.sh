#!/bin/bash -eux
echo "Setup vagrant user"

# add vagrant user (if it doesn't already exist)
if ! id -u vagrant >/dev/null 2>&1; then
    /usr/sbin/groupadd vagrant
    /usr/sbin/useradd vagrant -g vagrant -G wheel
    echo "vagrant" | passwd --stdin vagrant
fi

# give vagrant user permission to sudo
echo "Defaults:vagrant !requiretty" > /etc/sudoers.d/vagrant
echo "%vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
chmod 440 /etc/sudoers.d/vagrant

# installing vagrant key
mkdir -pm 700 /home/vagrant/.ssh
curl --insecure -o /home/vagrant/.ssh/authorized_keys https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh
chcon -R unconfined_u:object_r:user_home_t:s0 /home/vagrant/.ssh

# ssh tuning to prevent timeout delay
echo "UseDNS no" >> /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config

# vagrant box build date
date > /etc/vbox_build_time

# customize the message of the day
echo 'Welcome to your vagrant machine.' > /etc/motd
