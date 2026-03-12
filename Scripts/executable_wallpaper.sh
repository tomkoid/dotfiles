#!/usr/bin/env bash
set -o pipefail

wallpapers="$HOME/Wallpapers"
mode="fill"

get_wallpapers () {
  listed_wallpapers=$(fd . -L --full-path $wallpapers -e png -e jpg -e webp -e jpeg --color never -d 5)

  fmt_wallpapers=""

  for file_path in $listed_wallpapers
  do
      filename=$(echo $file_path | sed 's#^'$(basename $wallpapers)'/##')

      if [ "$fmt_wallpapers" == "" ]
      then
        fmt_wallpapers="$filename"
      else
        fmt_wallpapers+="\n$filename"
      fi
  done

  echo -e $fmt_wallpapers
}

wallpaper_command="swww img"

# recover wallpaper
if [ "$1" == "r" ]
then
  recover_wallpaper=$(cat ~/.cache/wallpaper)
  recover_mode=$(cat ~/.cache/wallpaper_mode)
  swww img "$recover_wallpaper" --resize $recover_mode>/dev/null
  exit 0
fi

set_background() {
  echo $1 > ~/.cache/wallpaper
  echo $2 > ~/.cache/wallpaper_mode
  # setsid -f swaybg --mode $mode -i $wallpapers/$1>/dev/null
  $wallpaper_command "$1">/dev/null
}

# echo $(get_wallpapers)

# background=$(ls $wallpapers | fzf --preview="swaybg --mode $mode -i $wallpapers/{}&>/dev/null" --preview-window=right:0% | xargs -I {} echo {})
background=$(get_wallpapers | fzf --preview="$wallpaper_command {}&>/dev/null" --preview-window=right:0% | xargs -I {} echo {})
# mode=$(printf "fit\nfill\nstretch\ncenter\ntile\nmax\n" | fzf --preview="swaybg --mode {} -i $wallpapers/$background&>/dev/null" --preview-window=right:0% | xargs -I {} echo {})

# echo $background

if [ background != "" ]
then
  if [ ! -f "${background}" ]
  then
    echo "ERROR: selected background doesn't exist"
    exit 1
  fi

  set_background "$background" $mode
fi
