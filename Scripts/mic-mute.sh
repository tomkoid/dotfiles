#!/usr/bin/env bash

pactl set-source-mute @DEFAULT_SOURCE@ toggle

muted=$(pactl get-source-mute @DEFAULT_SOURCE@ toggle | awk '{print $2}')

# # Send notification
# if [[ $muted == "yes" ]]
# then
#   notify-send -i /usr/share/icons/Papirus-Dark/32x32/devices/audio-input-microphone.svg "Mic" "Muted"
# elif [[ $muted == "no" ]]; then
#   notify-send -i /usr/share/icons/Papirus-Dark/32x32/devices/audio-input-microphone.svg "Mic" "Unmuted"
# fi

echo $muted
