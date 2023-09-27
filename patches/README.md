## Applied Patches
Here is a list of patches and customizations applied to `DWM` and `ST` in this repository:

- **DWM Patches:**
  - [`NoBorder`](https://dwm.suckless.org/patches/noborder/) - Remove the border when there is only one window visible. Find it in this file [dwm-noborderfloatingfix-6.2.diff](patches/dwm-noborderfloatingfix-6.2.diff).
  - [`SplitStatus`](https://dwm.suckless.org/patches/splitstatus/) - This patch replaces the standard statusbar items (window name to the right of the tags, and status on the right) with two status items: one in the centre, and one on the right. Find it in this file [dwm-splitstatus-20201114-61bb8b2.diff](patches/dwm-splitstatus-20201114-61bb8b2.diff).
  - [`FakeFullScreen`](https://dwm.suckless.org/patches/fakefullscreen/) - Only allow clients to "fullscreen" into space currently given to them. As an example, this will allow you to view a fullscreen video in your browser on one half of the screen, while having the other half available for other tasks. Find it in this file [dwm-fakefullscreen-20210714-138b405.diff](patches/dwm-fakefullscreen-20210714-138b405.diff).
  - [`HideVacantTags`](https://dwm.suckless.org/patches/hide_vacant_tags/) - This patch prevents dwm from drawing tags with no clients (i.e. vacant) on the bar. Find it in this file [dwm-hide_vacant_tags-6.3.diff](patches/dwm-hide_vacant_tags-6.3.diff).
  - [`Alpha`](https://dwm.suckless.org/patches/alpha/) - Allow dwm to have translucent bars, while keeping all the text on it opaque. Find it in this file [dwm-alpha-20230401-348f655.diff](patches/dwm-alpha-20230401-348f655.diff).
  - [`PreServeOnStart`](https://dwm.suckless.org/patches/preserveonrestart/) - By default, when dwm is recompiled-restarted all clients will lose it's current tag and collapse to first tag. This patch preserves clients on old tags, however note that layout order is not preserved. Find it in this file [dwm-preserveonrestart-6.3.diff](patches/dwm-preserveonrestart-6.3.diff).

- **ST Patches:**
  - [`ScrollBack`](https://st.suckless.org/patches/scrollback/) - Scroll back through terminal output using Shift+{PageUp, PageDown}. Find it in this file [st-scrollback-20210507-4536f46.diff](patches/st-scrollback-20210507-4536f46.diff)