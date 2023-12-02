#!/usr/bin/env bash

# Toggle mute/unmute of the default audio output device
pamixer -t 

# If MPD has playback status of "playing", pause it
if [ "$(mpc status | wc -l)" != "1" ]; then
  # If the device is muted, pause mpd
  if [ "$(pamixer --get-mute)" = "true" ]; then
    mpc pause
  else
    mpc play
  fi
fi

