#!/bin/bash
while true
do
  battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
  if [ $battery_level -le 10 ] && [ "$(acpi | awk '{ print $3 }' | sed "s/,//g")" == "Discharging" ]; then
    notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%"
  fi
 sleep 10
done
