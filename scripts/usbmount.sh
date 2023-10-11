#!/bin/bash
# Function to list available drives

list_drives() {
	lsblk -lp | awk '{print $1, "(" $4 ")"}' | grep sdb
}

# Display a list of drives using dmenu
selected_drive=$(list_drives | dmenu -p "Select a drive:" | awk '{print $1}')

sudo mount  "$selected_drive" /mnt/usb
notify-send "Mounted $selected_drive"
