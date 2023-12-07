#!/bin/bash

# initalize
mkdir .themes
mkdir .config
mkdir .tmux
mkdir Scripts

mkdir .config/mpd

# shell things
cp ~/.zshrc .
cp ~/.dots .
cp ~/.bash_aliases .
cp ~/.p10k.zsh .

# gtk themes
cp -r ~/.themes .themes/

# config files
cp -r ~/.config/alacritty .config/
cp -r ~/.config/amfora .config/
cp -r ~/.config/awesome .config/
cp -r ~/.config/bspwm .config/
cp -r ~/.config/cava .config/
cp -r ~/.config/conky .config/
cp -r ~/.config/dunst .config/
cp -r ~/.config/fish .config/
cp -r ~/.config/gtk-2.0 .config/
cp -r ~/.config/helix .config/
cp -r ~/.config/htop .config/
cp -r ~/.config/hypr .config/
cp -r ~/.config/kitty .config/
cp -r ~/.config/paru .config/
cp -r ~/.config/picom .config/
cp -r ~/.config/polybar .config/
cp -r ~/.config/rofi .config/
cp -r ~/.config/tmux .config/
cp -r ~/.config/swaylock .config/
cp -r ~/.config/sway .config/
cp -r ~/.config/sxhkd .config/
cp -r ~/.config/waybar .config/
cp -r ~/.config/mpv .config/
cp -r ~/.config/mpd/mpd.conf .config/mpd/
cp ~/.config/starship.toml .config/

cp -r ~/.tmux .

# scripts
cp -r ~/Scripts/* Scripts/
