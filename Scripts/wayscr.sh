#!/usr/bin/env bash

kitty -e "Scripts/wayscr-prompt.sh"

screenshot_type=$(cat /tmp/screenshot_type)

# grim -g "$(slurp)" - | /usr/bin/wl-copy
# grim -g $(slurp) - | wl-copy
# grim -g $(slurp) - | wl-copy
hyprshot -m ${screenshot_type} -r | wl-copy
