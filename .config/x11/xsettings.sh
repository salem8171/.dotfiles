#!/usr/bin/env bash

# Set Desktop background color
xsetroot -solid "#272822"

# Touchpad tapping
tapping_devices=$(xinput --list | grep -i Touchpad | grep -oP "(?<=id=)\d+")
for device_id in $tapping_devices; do
  tapping_id=$(xinput --list-props "$device_id" |
    grep -oPm 1 "(?<=Tapping Enabled \()\d+(?=\))")
  xinput --set-prop "$device_id" "$tapping_id" 1
done

# Keyboard sensitivity
xset r rate 250 50

# NumLock on by default
xset q | grep -q "Num Lock:\s*off" && xdotool key Num_Lock

# Disable default screensaving
xset s 0 0
xset dpms 0 0 0
