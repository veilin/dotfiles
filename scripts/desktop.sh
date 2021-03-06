#!/bin/bash

# GNOME extension to move bar to bottom
sudo apt install -y gnome-tweaks 
sudo apt install -y chrome-gnome-shell
git clone git://github.com/spin83/multi-monitors-add-on.git
cd multi-monitors-add-on
cp -r multi-monitors-add-on@spin83 ~/.local/share/gnome-shell/extensions/
#git clone https://github.com/home-sweet-gnome/dash-to-panel.git panel
#cd panel && make install
#cd ..
#rm -rf panel
#gnome-shell-extension-tool -e dash-to-panel

# Set up the desktop environment
#cp ../img/desktop.jpg ~/desktop.jpg
#cp ../img/lock.jpg ~/lock.jpg
#dconf load /org/gnome/ < ../../settings.dconf


# ULauncher
sudo add-apt-repository ppa:agornostal/ulauncher -y
sudo apt install ulauncher -y
