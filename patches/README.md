# Patch Architecture and Catalog

> Source-level patch governance for `dwm` and `st` in Void System.

## Documentation Links

- [Project README](../README.md)
- [System Configuration Guide](../configurations/README.md)

## Overview

This directory tracks upstream patch artifacts and documents why each patch exists in production. Patching at source level keeps behavior explicit, reviewable, and reproducible across rebuilds.

## Patch Strategy

- Maintain original patch artifacts in this folder for auditability and upgrade planning.
- Integrate selected changes into active source trees under [../dwm](../dwm) and [../st](../st).
- Prioritize workflow impact (focus, visibility, continuity) over cosmetic changes.
- Accept small behavioral trade-offs when they improve day-to-day operator efficiency.

## Patch Chronology

Context from the original root project timeline:

- `2023-09-24`: introduced `dwm` NoBorder + SplitStatus and `st` Scrollback.
- `2023-09-26`: added `dwm` FakeFullscreen and HideVacantTags.
- `2023-09-27`: added alpha rendering and preserve-on-restart behavior for `dwm`.

## Patch Catalog

### DWM

| Patch | Problem Addressed | Runtime Effect | Artifact |
| --- | --- | --- | --- |
| [noborder](https://dwm.suckless.org/patches/noborder/) | Single tiled window wastes visual space with border chrome. | Removes unnecessary border when only one client is visible. | [dwm-noborderfloatingfix-6.2.diff](dwm-noborderfloatingfix-6.2.diff) |
| [splitstatus](https://dwm.suckless.org/patches/splitstatus/) | Single status area limits information layout. | Supports separate center/right status text channels. | [dwm-splitstatus-20201114-61bb8b2.diff](dwm-splitstatus-20201114-61bb8b2.diff) |
| [fakefullscreen](https://dwm.suckless.org/patches/fakefullscreen/) | Fullscreen clients can disrupt tiled multitasking. | Keeps fullscreen behavior constrained to assigned tile area. | [dwm-fakefullscreen-20210714-138b405.diff](dwm-fakefullscreen-20210714-138b405.diff) |
| [hide_vacant_tags](https://dwm.suckless.org/patches/hide_vacant_tags/) | Empty tags add visual noise to the bar. | Renders only active/selected tags. | [dwm-hide_vacant_tags-6.3.diff](dwm-hide_vacant_tags-6.3.diff) |
| [alpha](https://dwm.suckless.org/patches/alpha/) | Opaque bar blocks wallpaper context and visual layering. | Adds translucent bar/background handling while keeping text legible. | [dwm-alpha-20230401-348f655.diff](dwm-alpha-20230401-348f655.diff) |
| [preserveonrestart](https://dwm.suckless.org/patches/preserveonrestart/) | Restarting `dwm` can collapse client tags and break workspace continuity. | Stores tag/monitor metadata so sessions recover with minimal context loss. | [dwm-preserveonrestart-6.3.diff](dwm-preserveonrestart-6.3.diff) |

### ST

| Patch | Problem Addressed | Runtime Effect | Artifact |
| --- | --- | --- | --- |
| [scrollback](https://st.suckless.org/patches/scrollback/) | Long terminal output is not navigable in base `st`. | Adds keyboard scrollback navigation (`Shift+PageUp/PageDown`). | [st-scrollback-20210507-4536f46.diff](st-scrollback-20210507-4536f46.diff) |
| [alpha](https://st.suckless.org/patches/alpha/) | Fully opaque terminal background conflicts with compositor-driven visual style. | Enables configurable terminal background transparency. | [st-alpha-osc11-20220222-0.8.5.diff](st-alpha-osc11-20220222-0.8.5.diff) |

## Technical Notes

- `splitstatus` support is integrated but disabled by default in [../dwm/config.h](../dwm/config.h) (`splitstatus = 0`).
- Preserve-on-restart behavior is implemented via `_NET_CLIENT_INFO` state handling in [../dwm/dwm.c](../dwm/dwm.c).
- Alpha behavior in `st` is configured in [../st/config.h](../st/config.h) and rendered in [../st/x.c](../st/x.c).

## Related Docs

- For system architecture and onboarding, see [Project README](../README.md).
- For startup behavior and runtime keybinding orchestration, see [System Configuration Guide](../configurations/README.md).