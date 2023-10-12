#!/bin/bash

# grim -g "$(slurp)" - | /usr/bin/wl-copy
grim -g $(slurp) - | /usr/bin/wl-copy
# hyprshot -m region -r | wl-copy
