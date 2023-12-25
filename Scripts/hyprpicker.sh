#!/usr/bin/env bash

hyprpicker | wl-copy

notify-send "Color copied to clipboard - $(wl-paste)"
