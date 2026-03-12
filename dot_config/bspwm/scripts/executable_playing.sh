#!/usr/bin/bash

output="$(playerctl --player=rhythmbox status 2>&1)"

if [[ "${output}" == "Paused" || "${output}" == "No players found" ]]
then
  exit 1
else
  exit 0
fi
