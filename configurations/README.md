# System Configuration Guide

> Runtime and user-environment configuration layer for Void System.

## Documentation Links

- [Project README](../README.md)
- [Patch Architecture and Catalog](../patches/README.md)

## Overview

This document covers the operational configuration that turns compiled binaries (`dwm`, `st`, `dmenu`) into a usable desktop session. The goal is to keep behavior explicit and reproducible through versioned dotfiles rather than hidden GUI state.

## Configuration Architecture

Runtime flow:

`TTY1 login` -> `.bash_profile` -> `startx` -> `.xinitrc` -> `sxhkd + picom + statusbar` -> `dwm`

Design intent:

- Start X only on `tty1` to avoid accidental GUI launches from non-primary terminals.
- Keep startup deterministic by launching all required session services from `.xinitrc`.
- Route user interactions through hotkeys and scripts instead of desktop applets.

## Tooling Baseline

The original documentation identified the following baseline tools for daily operation:

- `vim` for code and configuration editing.
- `htop` for terminal-native resource monitoring.
- `picom` for compositor effects and transparency support.
- `sxhkd` for global keyboard shortcut routing.
- `pulseaudio` tooling for audio device and stream control.
- `xbindkeys` as an optional legacy hotkey utility.

## Configuration File Map

| File | Responsibility | Engineering Decision |
| --- | --- | --- |
| [.bash_profile](.bash_profile) | Login shell bootstrap | Gates `startx` on `tty1` for controlled GUI initialization. |
| [.bashrc](.bashrc) | Interactive shell defaults | Keeps package-management aliases and prompt config in one source. |
| [.xinitrc](.xinitrc) | X session orchestration | Starts keyboard layout policy, wallpaper, compositor, hotkeys, and `dwm`. |
| [.config/sxhkd/sxhkdrc](.config/sxhkd/sxhkdrc) | Keybinding routing | Binds app launch, USB operations, and media controls to keyboard actions. |
| [.config/picom/picom.conf](.config/picom/picom.conf) | Compositor policy | Uses GLX + VSync and tuned blur/opacity for readability with alpha patches. |
| [.vim/vimrc](.vim/vimrc) | Editor baseline | Keeps a minimal, fast editing profile for terminal-first workflows. |

## Integration with Scripts

Session keybindings invoke scripts deployed to `~/.local/bin`:

- USB lifecycle: [../scripts/usbmount.sh](../scripts/usbmount.sh), [../scripts/usbunmount.sh](../scripts/usbunmount.sh)
- Power menu: [../scripts/powercontrol.sh](../scripts/powercontrol.sh)
- Status updates: [../scripts/statusbar.sh](../scripts/statusbar.sh)

This keeps system operations scriptable and testable without embedding logic inside the window manager.

## Historical Context

This configuration layer follows the project evolution from the original root timeline:

- `2023-09-23`: baseline `dwm` + `st` integration.
- `2023-10-02`: `dmenu` integration for command workflows.
- Patch milestones that shaped runtime behavior are documented in [Patch Architecture and Catalog](../patches/README.md#patch-chronology).

## Related Docs

- For system-level architecture and onboarding, see [Project README](../README.md).
- For patch-level decisions and artifact traceability, see [Patch Architecture and Catalog](../patches/README.md).
