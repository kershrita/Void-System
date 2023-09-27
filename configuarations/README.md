## System Tools & Configurations

These tools and configuration files provide the foundation for customizing **Void Linux** system with `dwm` and `st`.

### System Tools:

1. **Vim**: Efficient and highly configurable text editor with modal editing.
2. **Htop**: Interactive terminal-based system monitor for resource tracking.
3. **Picom**: Lightweight X11 compositor for window effects like transparency and shadows.
4. **Sxhkd**: Keyboard shortcut manager for executing commands and actions.

### Configuration Files:

1. `[.bash_profile](configurations/.bash_profile)` and `[.bashrc](configurations/.bashrc)`:

	- *.bash_profile*: This file is typically used for login shells and is executed when you log into your system.
	- *.bashrc*: This file is used for interactive non-login shells and is sourced every time you open a terminal. You can customize your shell environment by adding aliases, environment variables, and other settings to these files.

2. `[.xinitrc](configurations/.xinitrc)`: The .xinitrc file is a script that is executed when you start an X session using the startx command. You can use this file to configure your X session, launch window managers like dwm, set environment variables, and run other startup commands related to your desktop environment.
3. `[vimrc](configurations/.vim/vimrc)`: Configuration file for tailoring the behavior of the Vim text editor.
4. `[picom.conf](configurations/.config/picom/picom.conf)`: Customize visual effects and transparency settings for X11.
5. `[sxhkdrc](configurations/.config/sxhkd/sxhkdrc)`: Configure keyboard shortcuts and their associated commands for system control and application management.