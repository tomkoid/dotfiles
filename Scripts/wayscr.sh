#!/usr/bin/env bash


set -euo pipefail

# kitty -e "Scripts/wayscr-prompt.sh"
#
# screenshot_type=$1

# grim -g "$(slurp)" - | /usr/bin/wl-copy
# grim -g $(slurp) - | wl-copy
# grim -g "$(slurp)" - | swappy -f -
# hyprshot -m ${screenshot_type} --freeze --raw - | wl-copy
grimblast --cursor --wait 1 --freeze save area - | swappy -f -
