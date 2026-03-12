#!/usr/bin/env bash

output=$(playerctl status -a | grep "Playing")

lock_command="hyprlock"
suspend_command="systemctl suspend"

# Suspend only if nothing is playing
if [ -z "$output" ]; then
  # Stop any currently running mpc
  mpc stop

  # Lock before suspending
  setsid -f $lock_command &>/dev/null

  sleep 10

  if [[ $(cat /tmp/idle) == "idle" ]]
  then
    $suspend_command 

    # if still idle after suspending, suspend
    if [[ $(cat /tmp/idle) == "idle" ]]
    then
      $suspend_command
    fi
  fi
fi
