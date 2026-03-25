#!/usr/bin/env bash

# get a random display
display=$RANDOM
# start xwl satellite
xwayland-satellite :$display &
# wait till xwl satellite started
sleep 1
# start reaper
DISPLAY=:$display reaper
# kill xwl satellite after reaper closes
killall xwayland-satellite
