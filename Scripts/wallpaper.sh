set -o pipefail

wallpapers="$HOME/Wallpapers"

# recover wallpaper
if [ "$1" == "r" ]
then
  recover_wallpaper=$(cat ~/.cache/wallpaper)
  setsid -f swaybg -i $wallpapers/$recover_wallpaper>/dev/null
  exit 0
fi

set_background() {
  echo $1 > ~/.cache/wallpaper
  setsid -f swaybg -i $wallpapers/$1>/dev/null
} 

background=$(ls $wallpapers | fzf --preview="swaybg -i $wallpapers/{}&>/dev/null" --preview-window=right:0% | xargs -I {} echo {})

# echo $background

if [ background != "" ]
then
  if [ ! -f "${wallpapers}/${background}" ]
  then
    echo "ERROR: selected background doesn't exist"
    exit 1
  fi

  # kill background service
  pkill swaybg

  set_background $background
fi
