#!/bin/bash

echo "### INSTALL PACKAGES"
sudo pacman -Sy --needed --ask 4 - < install/dependencies/arch-dependencies.txt

echo "### INSTALL NEEDED FONTS"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip -O /tmp/JetBrainsMono.zip
unzip /tmp/JetBrainsMono.zip -d /tmp/
rm /tmp/JetBrainsMono.zip
rm /tmp/readme.md
sudo mv /tmp/JetBrains* /usr/share/fonts/TTF/
