## Installation vagrant et pré requis
```sh
apt-get install vagrant

# installation des plugins requis
vagrant plugin install --verbose vagrant-hostmanager
vagrant plugin install --verbose vagrant-cachier
```

# Utilisation
```sh
git clone https://github.com/orphaner/vagrantfiles.git
cd vagrantfiles/biroute

# Démarrage de la box vagrant
vagrant up

# Echange de clés ssh avec Vagrant
ssh-copy-id deploy@biroute.org
 
# Test de l'échange de clé (et donc que la machine vagrant fonctionne)
ansible beroot.local -i hosts -m ping -vvvv -u deploy
```
