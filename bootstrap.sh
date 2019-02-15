#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export PYPY3_VERSION=pypy3.5-v7.0.0
export PYPY3_URL=https://bitbucket.org/pypy/pypy/downloads/$PYPY3_VERSION-linux64.tar.bz2
export REPO_URL=https://github.com/carlstrand/epost.git
export BOOTSTRAP_BASE_URL=https://raw.githubusercontent.com/carlstrand/epost/dev/
export ANSIBLE_WORKDIR=~/ansible
export PYPY3_BIN=/opt/$PYPY3_VERSION/bin/pypy3
export PIP3_BIN=/opt/$PYPY3_VERSION/bin/pipi3

curl -s $BOOTSTRAP_BASE_URL/env-setup.sh | sudo bash
curl -s $BOOTSTRAP_BASE_URL/env-apt.sh | sudo bash
#curl -s $BOOTSTRAP_BASE_URL/locale-setup.sh | sudo bash

mkdir -p $ANSIBLE_WORKDIR
mkdir -p $PYPY3_BIN

git clone --quiet --progress --single-branch --branch dev $REPO_URL $ANSIBLE_WORKDIR 

#############################################
wget -O pypy3.tar.bz2 $PYPY3_URL
tar -xf pypy3.tar.bz2 -C /opt/$PYPY3_VERSION --strip-components=1
rm -f pypy3.tar.bz2 

cd $ANSIBLE_WORKDIR

sudo virtualenv -p $PYPY3_BIN .
sudo source ./bin/activate

sudo $PYPY3_BIN -m --quiet ensurepip
sudo $PIP3_BIN install --upgrade pip --quiet --progress-bar pretty
sudo $PIP3_BIN install ansible ansible-lint ansible-review --quiet --progress-bar pretty


#sudo pypy3 psqlcom.py
#sudo apl-test -vvv
#sudo pip3 install psycopg2cffi pycrypto pycparser paramiko 