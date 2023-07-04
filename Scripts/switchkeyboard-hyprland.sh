#!/usr/bin/env bash

if [ ! -f "$HOME/.config/current-keyboard" ]
then
  echo "Generate current-keyboard"
  echo us > ~/.config/current-keyboard
fi

keyboard=$(cat ~/.config/current-keyboard)

notify() {
  notify-send "Keyboard ($(date +"%H:%M:%S"))" "Switched keyboard to $1" --icon ~/.config/hypr/keyboard.svg
}

if [ "$keyboard" == "us" ]
then
  # hyprctl keyword input:kb_variant intl
  hyprctl keyword input:kb_layout us
  notify us

  echo cz > ~/.config/current-keyboard
fi

if [ "$keyboard" == "cz" ]
then
  # hyprctl keyword input:kb_variant qwerty 
  hyprctl keyword input:kb_layout cz 
  notify cz 

  echo us > ~/.config/current-keyboard
fi

