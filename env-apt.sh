#!/bin/bash

sudo apt --quiet --yes update  && sudo apt --quiet --yes upgrade
sudo apt --quiet --yes install \
        apt-transport-https \
        apt-utils \
        libtinfo-dev \
        virtualenv \
        build-essential \
        git \
        libssl-dev \
        nano \
        wget