#!/bin/bash

# ajout du dépot mongodb
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

# update / upgrade
sudo aptitude update
sudo apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -fuy dist-upgrade

# install mongodb 3.0.8
sudo apt-get install -y mongodb-org=3.0.8 mongodb-org-server=3.0.8 mongodb-org-shell=3.0.8 mongodb-org-mongos=3.0.8 mongodb-org-tools=3.0.8

# PIN de la version
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections

# Ajout de l'utilisateur deploy pour ansible
sudo useradd -p $( mkpasswd deploy ) -m -s /bin/bash -d /home/deploy deploy
#sudo reboot
echo "deploy ALL=(ALL) NOPASSWD: ALL " > /etc/sudoers.d/deploy
cp /vagrant/.bashrc /root/
cp /vagrant/.bashrc /home/deploy
chown deploy:deploy /home/deploy/.bashrc
