#!/usr/bin/env bash

PARTITION=$1
MAPPER="/dev/mapper/hdd"

if [[ "$1" == "" ]]; then
  echo "usage: $0 <device>"
  exit 1
fi

sudo cryptsetup open $PARTITION hdd || exit 1

sudo mkdir -p /run/media/$USER/hdd
sudo mount /dev/mapper/hdd /run/media/$USER/hdd || exit 1
sudo chown $USER:$USER /run/media/$USER/hdd
sudo chmod 777 /run/media/$USER/hdd

echo "hdd mounted"
echo "press any key to unmount"

read

echo "making sure everything saved.. (this may take a while)"
sync

while [ -e "$MAPPER" ]; do
  echo "unmounting $MAPPER"
  sudo umount $MAPPER

  if mount | grep -q "$MAPPER on"; then
    echo "waiting for $MAPPER to unmount"
    sleep 1
  else
    break
  fi
done

sudo cryptsetup close hdd

if lsblk -no TYPE "$PARTITION" | grep -q crypt; then
    echo "$PARTITION is still unlocked"
else
    echo "$PARTITION has been locked"
fi
