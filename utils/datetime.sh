#!/bin/bash

search=$1

format='%a %F %T %z'
zoneinfo=/usr/share/zoneinfo/posix/

if command -v timedatectl >/dev/null; then
    tzlist=$(timedatectl list-timezones)
else
    tzlist=$(find -L $zoneinfo -type f -printf "%P\n")
fi

grep -i "$search" <<< "$tzlist" \
| while read z
  do
      d=$(TZ=$z date +"$format")
      printf "%-32s %s\n" "$z" "$d"
  done
