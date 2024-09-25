#!/usr/bin/env bash

playerctl_was_playing=`cat $HOME/.cache/playerctl-playing`
spotify_was_playing=`cat $HOME/.cache/spotify-playing`

# Toggle mute/unmute of the default audio output device
pamixer -t 

# If MPD has playback status of "playing", pause it
# if [ "$(mpc status | wc -l)" != "1" ]; then
# If the device is muted, pause mpd
if [ "$(pamixer --get-mute)" == "true" ]; then
  # set playerctl as playing
  if [ "$(playerctl status)" == "Playing" ]; then
    playerctl pause
    echo "1" > $HOME/.cache/playerctl-playing
  fi

  if [ "$(mpc status | wc -l)" != "1" ]; then
    mpc pause
  fi
else
  if [ "$playerctl_was_playing" == "1" ]; then
    playerctl play 
    echo "0" > $HOME/.cache/playerctl-playing
  fi
  if [ "$(mpc status | wc -l)" != "1" ]; then
    mpc play
  fi
fi

# spotify (playerctl -p spotify)
if [ "$(playerctl -p spotify status)" == "Playing" ]; then
  playerctl -p spotify play-pause
  echo "1" > $HOME/.cache/spotify-playing
elif [ "$spotify_was_playing" == "1" ]; then
  playerctl -p spotify play
  echo "0" > $HOME/.cache/spotify-playing
fi
