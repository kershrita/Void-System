# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

# Open DWM after login
[[ ! $DISPLAY && $(tty) = "/dev/tty1" ]] && startx 
