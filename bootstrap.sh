#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y software-properties-common apt-utils locales
sudo apt install -y libffi-dev libssl-dev libyaml-cpp-dev apt-transport-https python python-dev python-pip python-setuptools git build-essential 
sudo pip install pip --upgrade -qqq
sudo pip install psycopg2 setuptools paramiko pycparser pycrypto virtualenv ansible ansible-lint --upgrade -qqq

git clone https://github.com/carlstrand/epost.git
cd ~/epost

#wget -O- https://rspamd.com/apt-stable/gpg.key | sudo apt-key add -
#echo "deb http://rspamd.com/apt-stable/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/rspamd.list
#sudo apt update
#sudo apt install rspamd

sudo ansible-playbook tasks/main.yml -vvv --check
