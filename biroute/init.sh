#!/bin/bash

#sudo aptitude update
#sudo apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade -y
sudo useradd -p $( mkpasswd deploy ) -m -s /bin/bash -d /home/deploy deploy
#sudo reboot
echo "deploy ALL=(ALL) NOPASSWD: ALL " > /etc/sudoers.d/deploy
cp /vagrant/.bashrc /root/
cp /vagrant/.bashrc /home/deploy
chown deploy:deploy /home/deploy/.bashrc
