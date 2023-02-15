#!/usr/bin/bash

if ~/.config/bspwm/scripts/playing.sh
then
  playerctl --follow metadata --format '{{ artist }} - {{ title }}' &
  sleep 0.1
  pkill playerctl
else
  exit 1
fi
