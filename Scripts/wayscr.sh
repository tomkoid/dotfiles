#!/usr/bin/env bash

# grim -g "$(slurp)" - | /usr/bin/wl-copy
grim -g $(slurp) - | wl-copy
# hyprshot -m region -r | wl-copy
