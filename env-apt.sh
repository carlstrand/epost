#!/bin/bash

sudo apt update --quiet --yes && sudo apt upgrade --quiet --yes

sudo apt --quiet --yes install \
        software-properties-common \
        apt-transport-https \
        apt-utils \
        libtinfo-dev \
        virtualenv \
        build-essential \
        git \
        libssl-dev \
        nano \
        wget