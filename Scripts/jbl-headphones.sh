#!/usr/bin/env bash

mac="74:5B:C5:73:96:05"

# remove if already exists
bluetoothctl remove 74:5B:C5:73:96:05

# scan for devices
notify-send "JBL Headphones" "Scanning for devices..."
setsid -f bluetoothctl scan on > /dev/null

# sleep for a bit
sleep 5

# connect to device
notify-send "JBL Headphones" "Connecting to the device..."


# connect to device in loop if not connected
while [ "$(bluetoothctl info $mac | grep "Connected: yes")" == "" ]
do
    echo "Connecting..."
    notify-send "JBL Headphones" "Connecting to the device..."
    bluetoothctl connect $mac
    sleep 2 
done


notify-send "JBL Headphones" "Connected!"

# mark as trusted
bluetoothctl trust $mac

sleep 2

pamixer --set-volume 50
