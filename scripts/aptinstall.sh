#!/bin/bash

sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
install gnome-tweaks
install chromium-browser
install curl
install wget
install exfat-utils
install git
install htop
install tig
install synaptic

# Image processing
install gimp
install inkscape
#install jpegoptim
#install optipng
	
# Fun stuff
install figlet
install wine
install winetricks

# Dev tools
install mysql-workbench
install npm
