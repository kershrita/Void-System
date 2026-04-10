# Void System

> A source-driven Linux desktop engineering project that turns `dwm`, `st`, and `dmenu` into a cohesive, reproducible workstation on Void Linux.

## Documentation Map

- [Project Overview (this document)](README.md)
- [System Configuration Guide](configurations/README.md)
- [Patch Architecture and Catalog](patches/README.md)

## Overview

Void System is a custom desktop stack built on the Suckless toolchain and tuned for keyboard-first engineering workflows. Instead of layering heavyweight desktop abstractions, it composes a minimal window manager, terminal, launcher, and shell scripts into a maintainable system that can be rebuilt from source at any time.

It focuses on:

- Deterministic behavior through compile-time configuration (`config.h`, `config.mk`).
- Low-overhead UX with direct X11 event handling and minimal background services.
- Operational tooling for day-to-day tasks (status telemetry, power actions, removable media).

Real-world use cases:

- Software engineering sessions with multiple tiled terminals, browser windows, and file explorers.
- Laptop workflows that need fast suspend/reboot controls and live battery/network visibility.
- Long-running work sessions where preserving workspace tags after window manager restart reduces context loss.

## Evolution Timeline

This timeline preserves context from the original root README and links it to detailed docs:

- `2023-09-23`: Added `dwm` and `st` as the base desktop runtime.
- `2023-09-24`: Added NoBorder and SplitStatus for `dwm`, plus ScrollBack for `st` (see [Patch Chronology](patches/README.md#patch-chronology)).
- `2023-09-26`: Added FakeFullScreen and HideVacantTags for `dwm` (see [Patch Catalog](patches/README.md#patch-catalog)).
- `2023-09-27`: Added Alpha and PreserveOnRestart for `dwm` (see [Patch Catalog](patches/README.md#patch-catalog)).
- `2023-10-02`: Added `dmenu` to complete launcher/control workflows (see [System Configuration Guide](configurations/README.md)).

## Architecture

The system architecture is shown below.

![Void System Architecture Flow](assets/Void%20System%20Architecture%20Flow.png)

The diagram captures session bootstrap, runtime services, status telemetry flow, and the source-level patch/configuration layer.

## Features

- Patch-integrated `dwm` behavior for hide-vacant-tags, split-status support, alpha bar rendering, and restart tag preservation.
- Keyboard-centric navigation and task execution through `dwm` keymaps plus `sxhkd` hotkeys.
- Real-time status bar pipeline with RAM, CPU, battery, network, volume, USB mount state, and clock updates.
- Minimal control utilities for power operations and USB mount/unmount flows using `dmenu` as the command surface.
- Multi-monitor support via Xinerama-enabled builds.

## Technical Highlights

- Uses source-level configuration (`config.h`) over runtime theme frameworks to keep behavior auditable and diffable.
- Implements workspace continuity through `_NET_CLIENT_INFO` tag/monitor properties in `dwm`, reducing disruption during recompiles and restarts.
- Keeps the status path lightweight by writing directly to X root window name (`xsetroot`) once per second.
- Separates concerns cleanly: core WM logic in C, operator workflows in POSIX shell, and environment bootstrap in dotfiles.
- Balances aesthetics and performance by combining alpha patches in `dwm` and `st` with `picom` blur/opacity policies.

## Tech Stack

- Language: C (Suckless components), POSIX shell (automation scripts)
- Platform: Void Linux, X11
- Windowing/UI: `dwm` 6.4, `st` 0.9, `dmenu` 5.2
- Graphics/Text: Xlib, Xft, Xrender, Fontconfig, Freetype
- Runtime tooling: `sxhkd`, `picom`, PulseAudio/ALSA utilities, `xsetroot`, `lsblk`, `notify-send`
- Build system: Make (`make`, `make install`)

## Getting Started

### Prerequisites

Install required build and runtime dependencies on Void Linux:

```bash
sudo xbps-install -S base-devel git pkg-config \
	libX11-devel libXft-devel libXinerama-devel \
	fontconfig-devel freetype-devel \
	xorg picom sxhkd xwallpaper dmenu
```

### Installation

```bash
git clone <repo-url>
cd Void-System

cd dwm && sudo make clean install && cd ..
cd st && sudo make clean install && cd ..
cd dmenu && sudo make clean install && cd ..
```

### Configure Local Environment

```bash
mkdir -p ~/.config/sxhkd ~/.config/picom ~/.local/bin
cp configurations/.bashrc ~/.bashrc
cp configurations/.bash_profile ~/.bash_profile
cp configurations/.xinitrc ~/.xinitrc
cp configurations/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
cp configurations/.config/picom/picom.conf ~/.config/picom/picom.conf
cp scripts/*.sh ~/.local/bin/
chmod +x ~/.local/bin/*.sh
```

### Run

- Log in on `tty1`; `.bash_profile` triggers `startx`, which launches the configured `dwm` session.
- Use `Super + Return` for terminal, `Super + p` for launcher, and configured hotkeys for USB/audio/power controls.

## Results

- A reproducible, source-controlled desktop environment with no opaque GUI settings drift.
- Fast interaction model optimized for keyboard-driven multitasking and development workflows.
- Session resilience: tag assignments are preserved across `dwm` restarts through EWMH client metadata.
- Low runtime overhead with a simple status telemetry loop and minimal background services.
- Clear customization traceability through versioned patch artifacts and explicit configuration files.
