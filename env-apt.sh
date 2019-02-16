#!/bin/bash

sudo apt-get --quiet --yes update  && sudo apt-get --quiet --yes upgrade
sudo apt --quiet --yes install apt-transport-https apt-utils python-apt python-docutils python-jinja2 python-setuptools python-yaml libtinfo-dev virtualenv build-essential git libssl-dev nano wget make

                        cdbs
                        debootstrap
                        devscripts
                        
                        pbuilder

            

sudo apt-get clean
