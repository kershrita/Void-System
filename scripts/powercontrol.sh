#!/bin/bash

# Options to display in dmenu
options=("Shutdown" "Reboot" "Cancel")

# Prompt user for action
chosen_option=$(printf '%s\n' "${options[@]}" | dmenu -p "Choose an option:")

# Perform the selected action
case "$chosen_option" in
    "Shutdown")
        sudo poweroff
        ;;
    "Reboot")
        sudo reboot
        ;;
    "Cancel")
        # Do nothing if the "Cancel" option is selected
        ;;
esac

