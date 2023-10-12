# set languages layout + keyboard
setxkbmap -layout us,ara -variant ,digits -option grp:win_space_toggle caps:swapescape

# set hotkeys to call prgrams
sxhkd &

# set wallpaper
xwallpaper --zoom Downloads/Pictures/orange_cliff.jpg

# show bettary capacity
xsetroot -name $(cat /sys/class/power_supply/BAT0/capacity)

# picom composite manager
picom &

# initalize DWM
dwm
