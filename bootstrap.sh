#!/bin/bash
sudo apt-get update -qq
sudo apt install -y software-properties-common apt-utils locales
sudo apt install -y libffi-dev libssl-dev libyaml-cpp-dev apt-transport-https
sudo apt install -y python python-dev python-pip python-setuptools git build-essential 
sudo pip install pip --upgrade -qqq
sudo pip install setuptools paramiko pycparser pycrypto --upgrade -qqq
sudo pip install virtualenv ansible ansible-lint

git clone https://github.com/carlstrand/epost.git
cd ~/epost

#wget -O- https://rspamd.com/apt-stable/gpg.key | sudo apt-key add -
#echo "deb http://rspamd.com/apt-stable/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/rspamd.list
#sudo apt update
#sudo apt install rspamd

sudo ansible-playbook tasks/main.yml -vvv