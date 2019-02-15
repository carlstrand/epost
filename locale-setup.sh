#!/bin/bash
sudo apt --quiet --yes --fix install locales
sudo locale-gen sv_SE sv_SE.UTF-8
sudo dpkg-reconfigure locales 