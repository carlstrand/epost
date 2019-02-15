#!/bin/bash

echo "alias apl='ansible-playbook'
alias apl-def='ansible-playbook -i hosts site.yml'
alias apl-test='ansible-playbook -i hosts site.yml --check'
alias pip3='~/ansible/bin/pip3'
alias pypy3='~/ansible/bin/pypy3'" >> ~/.bashrc 

source ~/.bashrc 

echo "deb http://nginx.org/packages/mainline/ubuntu bionic nginx" | sudo tee /etc/apt/sources.list.d/nginx.list > /dev/null
echo "deb http://rspamd.com/apt-stable/ bionic main" | sudo tee /etc/apt/sources.list.d/rspamd.list > /dev/null
echo "deb https://deb.nodesource.com/11.x bionic main" | sudo tee /etc/apt/sources.list.d/nodesource.list > /dev/null


curl -fsL --progress-bar https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
curl -fsL --progress-bar https://rspamd.com/apt-stable/gpg.key | sudo apt-key add - 
curl -fsL --progress-bar https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -

sudo apt --quiet --yes update
sudo apt --quiet --yes install software-properties-common

sudo add-apt-repository ppa:certbot/certbot
sudo apt-key fingerprint ABF5BD827BD9BF62

#echo "deb-src https://deb.nodesource.com/11.x bionic main" | sudo tee -a /etc/apt/sources.list.d/nodesource.list > /dev/null
#curl -fsL --progress-bar https://deb.nodesource.com/setup_11.x | sudo -E bash - > /dev/null

# - 'deb http://nginx.org/packages/ubuntu/ {{ ansible_distribution_release }} nginx'
#- 'deb http://rspamd.com/apt-stable/ {{ ansible_distribution_release }} main'




