#!/usr/bin/env bash

echo "press any key to reboot to windows.."
read
echo "rebooting to windows.."

systemctl reboot --boot-loader-entry=auto-windows
