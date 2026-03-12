#!/usr/bin/env bash

function get_volume()
{
    mixer=$(amixer get Master | grep 'Front Left:')
    # echo $mixer
    echo $mixer | cut -d ' ' -f 5 | sed "s/\[//g" | sed "s/\]//g"
}

vol=$(get_volume)

while [ true ]
do
  newvol=$(get_volume)
  if [ "$vol" != "$newvol" ]
  then
    echo $newvol
    vol=$newvol
  fi

  sleep 0.1
done

