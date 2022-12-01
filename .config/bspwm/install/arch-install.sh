#!/bin/bash

echo "### INSTALL PACKAGES"
sudo pacman -Sy --needed --ask 4 - < install/dependencies/arch-dependencies.txt
