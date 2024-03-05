# Enable screen saver after 10 minutes
xset s on
xset s 600

# Setup monitors
monitor-setup

# Change background image
feh --bg-center ~/pictures/wallpapers/aesthetic-wallpapers/images/dark_pixelart.png --image-bg '#0a0a0a'

# NOTE(gvicentin): Status bar loop
while true; do
    statusbar
	sleep 1m
done &

# Use xautolock to detect user inactivity in X and slock utility
xautolock -time 11 -locker slock &

# Dunst for notifications
dunst &

# NOTE(gvicentin): Executing dwm like this allows to restart
# dwm without logging our or closing applications.
while true; do
	# NOTE(gvicentin): Logging error to a file or dont
	# dwm 2> ~/.dwm.log
	dwm >/dev/null 2>&1
done
