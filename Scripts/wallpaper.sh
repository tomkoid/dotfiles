#!/usr/bin/env bash
set -o pipefail

wallpapers="$HOME/Wallpapers"
mode="fill"

get_wallpapers () {
  listed_wallpapers=$(fd --full-path $wallpapers -e png -e jpg -e webp -e jpeg --color never)

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

wallpaper_command="swaybg -m fill -i"

# recover wallpaper
if [ "$1" == "r" ]
then
  recover_wallpaper=$(cat ~/.cache/wallpaper)
  recover_mode=$(cat ~/.cache/wallpaper_mode)
  setsid -f swaybg -i "$wallpapers/$recover_wallpaper" --mode $recover_mode>/dev/null
  exit 0
fi

set_background() {
  echo $1 > ~/.cache/wallpaper
  echo $2 > ~/.cache/wallpaper_mode
  # setsid -f swaybg --mode $mode -i $wallpapers/$1>/dev/null
  setsid -f $wallpaper_command "$wallpapers/$1">/dev/null
} 

pkill swaybg

# background=$(ls $wallpapers | fzf --preview="swaybg --mode $mode -i $wallpapers/{}&>/dev/null" --preview-window=right:0% | xargs -I {} echo {})
background=$(get_wallpapers | fzf --preview="$wallpaper_command $wallpapers/{}&>/dev/null" --preview-window=right:0% | xargs -I {} echo {})
# mode=$(printf "fit\nfill\nstretch\ncenter\ntile\nmax\n" | fzf --preview="swaybg --mode {} -i $wallpapers/$background&>/dev/null" --preview-window=right:0% | xargs -I {} echo {})

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

  set_background "$background" $mode
fi
