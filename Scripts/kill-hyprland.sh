#!/usr/bin/env bash

swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit Hyprland? This will end your Wayland session.' -B 'Yes, exit' 'hyprctl dispatch exit'
