# Void Linux System
**[`DWM`](https://st.suckless.org/)** (Dynamic Window Manager) is a minimalist and highly customizable tiling window manager for X11. **[`ST`](https://dwm.suckless.org/)** (Simple Terminal) is a minimalistic terminal emulator also from the Suckless project. Both are known for their simplicity, speed, and extensibility.

This repository includes my personal configurations, patches, and customizations for `DWM` and `ST` on **Void Linux**. These customizations are designed to tailor the user experience to my specific needs while maintaining the spirit of simplicity and efficiency that both `DWM` and `ST` are known for.

## Applied Patches
Here is a list of patches and customizations applied to `DWM` and `ST` in this repository:

- **DWM Patches:**
  - [`NoBorder`](https://dwm.suckless.org/patches/noborder/) - Remove the border when there is only one window visible. Find it in this file [dwm-noborderfloatingfix-6.2.diff](patches/dwm-noborderfloatingfix-6.2.diff)
  - [`SplitStatus](https://dwm.suckless.org/patches/splitstatus/) - This patch replaces the standard statusbar items (window name to the right of the tags, and status on the right) with two status items: one in the centre, and one on the right. Find it in this file [dwm-splitstatus-20201114-61bb8b2.diff](patches/dwm-splitstatus-20201114-61bb8b2.diff)

- **ST Patches:**
  - [`ScrollBack`](https://st.suckless.org/patches/scrollback/) - Scroll back through terminal output using Shift+{PageUp, PageDown}. Find it in this file [st-scrollback-20210507-4536f46.diff](patches/st-scrollback-20210507-4536f46.diff)
