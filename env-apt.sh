#!/bin/bash

sudo apt update --quiet --yes && sudo apt upgrade --quiet --yes

sudo apt --quiet --yes --fix install \
        software-properties-common \
        apt-transport-https \
        apt-utils \
        virtualenv \
        build-essential \
        git \
        libssl-dev \
        nano \
        wget