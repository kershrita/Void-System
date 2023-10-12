# set languages layout + keyboard
setxkbmap -layout us,ara -variant ,digits -option grp:win_space_toggle caps:swapescape

# set hotkeys to call prgrams
sxhkd &

# set wallpaper
xwallpaper --zoom Downloads/Pictures/orange_cliff.jpg

# show status bar
bash .local/bin/statusbar.sh &

# picom composite manager
picom &

# initalize DWM
dwm
