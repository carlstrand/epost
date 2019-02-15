#!/bin/bash
sudo apt --quiet --yes --fix install locales
sudo locale-gen sv_SE sv_SE.UTF-8
sudo dpkg-reconfigure locales 

export LC_ALL="sv_SE.UTF-8"
export LC_CTYPE="sv_SE.UTF-8"