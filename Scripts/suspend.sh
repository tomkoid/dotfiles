#!/usr/bin/env bash

output=$(playerctl status -a | grep "Playing")

# Suspend only if nothing is playing
if [ -z "$output" ]; then
  systemctl suspend
fi
