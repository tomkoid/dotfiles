set -o pipefail

wallpapers="$HOME/Wallpapers"
mode="fit"

# recover wallpaper
if [ "$1" == "r" ]
then
  recover_wallpaper=$(cat ~/.cache/wallpaper)
  recover_mode=$(cat ~/.cache/wallpaper_mode)
  setsid -f swaybg --mode $recover_mode -i $wallpapers/$recover_wallpaper>/dev/null
  exit 0
fi

set_background() {
  echo $1 > ~/.cache/wallpaper
  echo $2 > ~/.cache/wallpaper_mode
  setsid -f swaybg --mode $mode -i $wallpapers/$1>/dev/null
} 

background=$(ls $wallpapers | fzf --preview="swaybg --mode $mode -i $wallpapers/{}&>/dev/null" --preview-window=right:0% | xargs -I {} echo {})
mode=$(printf "fit\nfill\nstretch\ncenter\ntile\nmax\n" | fzf --preview="swaybg --mode {} -i $wallpapers/$background&>/dev/null" --preview-window=right:0% | xargs -I {} echo {})

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

  set_background $background $mode
fi
