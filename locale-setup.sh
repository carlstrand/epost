#!/bin/bash
sudo apt --quiet --yes install locales
sudo locale-gen sv_SE sv_SE.UTF-8
sudo update-locale LANG="sv_SE.UTF-8" LANGUAGE="sv_SE"
sudo dpkg-reconfigure locales

export LANGUAGE="sv_SE.utf8"
export LC_ALL="sv_SE.UTF-8"
export LC_CTYPE="sv_SE.UTF-8"
