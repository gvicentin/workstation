#!/bin/bash

# Get battery status and filter out the mouse battery info
BATTINFO=$(acpi -b | grep -v 'rate information unavailable')
if [[ "$(echo $BATTINFO | grep Discharging)" && "$(echo $BATTINFO | cut -f 5 -d " ")" < 00:50:00 ]] ; then
    DISPLAY=:0.0 /usr/bin/notify-send -u critical "Low battery" "$BATTINFO"
fi
