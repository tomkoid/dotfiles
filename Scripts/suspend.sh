#!/usr/bin/env bash

output=$(playerctl status)

# Suspend only if nothing is playing
if [ $output == "No players found" ] || [ $output == "Stopped" ] || [ $output == "Paused" ]; then
  systemctl suspend
fi
