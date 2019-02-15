#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

sudo apt update -y -q && sudo apt upgrade -y -q
sudo apt install -y -q software-properties-common 

echo 'alias apl=ansible-playbook' >> ~/.bashrc 
echo 'alias apl-def=ansible-playbook -i hosts site.yml' >> ~/.bashrc 
echo 'alias apl-test=ansible-playbook -i hosts site.yml --check' >> ~/.bashrc 
echo 'alias pip3=~/ansible/bin/pip3' >> ~/.bashrc 
echo 'alias pypy3=~/ansible/bin/pypy3' >> ~/.bashrc 

echo "deb http://nginx.org/packages/mainline/ubuntu `lsb_release -cs` nginx" | sudo tee /etc/apt/sources.list.d/nginx.list
echo "deb http://rspamd.com/apt-stable/ $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list.d/rspamd.list
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
curl -fsSL https://rspamd.com/apt-stable/gpg.key | sudo apt-key add -
curl -fsSL https://deb.nodesource.com/setup_11.x | sudo -E bash -

# - 'deb http://nginx.org/packages/ubuntu/ {{ ansible_distribution_release }} nginx'
#- 'deb http://rspamd.com/apt-stable/ {{ ansible_distribution_release }} main'
sudo apt-key fingerprint ABF5BD827BD9BF62
sudo add-apt-repository ppa:certbot/certbot


export PYPY3_VERSION=pypy3.5-v7.0.0
export PYPY3_URL=https://bitbucket.org/pypy/pypy/downloads/$(PYPY3_VERSION)-linux64.tar.bz2
export REPO_URL=https://github.com/carlstrand/epost.git
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

sudo apt update -y -q && sudo apt upgrade -y -q
sudo apt install -y apt-transport-https apt-utils locales virtualenv build-essential git libssl-dev
sudo dpkg-reconfigure locales

mkdir ~/ansible
mkdir -p ~/.local/$PYPY3_VERSION

git clone -b dev $REPO_URL ~/ansible

#############################################
wget -O pypy3.tar.bz2 $PYPY3_URL
tar -xf pypy3.tar.bz2 -C ~/.local/$PYPY3_VERSION --strip-components=1
rm -f pypy3.tar.bz2 

cd ~/ansible
sudo virtualenv -p ~/.local/$PYPY3_VERSION/bin/pypy3 .
sudo source ./bin/activate
sudo ~/.local/$PYPY3_VERSION/bin/pypy3 -m ensurepip
sudo ~/.local/$PYPY3_VERSION/bin/pypy3 -m pip install --upgrade pip --quiet
#sudo pip3 install psycopg2cffi pycrypto pycparser paramiko 
sudo ~/.local/$PYPY3_VERSION/bin/pip3 install ansible ansible-lint ansible-review


sudo pypy3 psqlcom.py
#sudo apl-test -vvv