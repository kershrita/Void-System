## Applied Patches
Here is a list of patches and customizations applied to `dwm` and `st` in this repository:

- **DWM Patches:**
  - [`noborder`](https://dwm.suckless.org/patches/noborder/) - Remove the border when there is only one window visible. Find it in this file [dwm-noborderfloatingfix-6.2.diff](dwm-noborderfloatingfix-6.2.diff).
  - [`splitstatus`](https://dwm.suckless.org/patches/splitstatus/) - This patch replaces the standard statusbar items (window name to the right of the tags, and status on the right) with two status items: one in the centre, and one on the right. Find it in this file [dwm-splitstatus-20201114-61bb8b2.diff](dwm-splitstatus-20201114-61bb8b2.diff).
  - [`fakefullscreen`](https://dwm.suckless.org/patches/fakefullscreen/) - Only allow clients to "fullscreen" into space currently given to them. As an example, this will allow you to view a fullscreen video in your browser on one half of the screen, while having the other half available for other tasks. Find it in this file [dwm-fakefullscreen-20210714-138b405.diff](dwm-fakefullscreen-20210714-138b405.diff).
  - [`hidevacanttags`](https://dwm.suckless.org/patches/hide_vacant_tags/) - This patch prevents dwm from drawing tags with no clients (i.e. vacant) on the bar. Find it in this file [dwm-hide_vacant_tags-6.3.diff](dwm-hide_vacant_tags-6.3.diff).
  - [`alpha`](https://dwm.suckless.org/patches/alpha/) - Allow dwm to have translucent bars, while keeping all the text on it opaque. Find it in this file [dwm-alpha-20230401-348f655.diff](patches/dwm-alpha-20230401-348f655.diff).
  - [`preserveonstart`](https://dwm.suckless.org/patches/preserveonrestart/) - By default, when dwm is recompiled-restarted all clients will lose it's current tag and collapse to first tag. This patch preserves clients on old tags, however note that layout order is not preserved. Find it in this file [dwm-preserveonrestart-6.3.diff](dwm-preserveonrestart-6.3.diff).

- **ST Patches:**
  - [`scrollback`](https://st.suckless.org/patches/scrollback/) - Scroll back through terminal output using Shift+{PageUp, PageDown}. Find it in this file [st-scrollback-20210507-4536f46.diff](st-scrollback-20210507-4536f46.diff)
  - [`alpha`](https://st.suckless.org/patches/alpha/) - This patch allows users to change the opacity of the background. Note that you need an X composite manager (e.g. compton, xcompmgr) to make this patch effective. Find it in this file [st-alpha-osc11-20220222-0.8.5.diff](st-alpha-osc11-20220222-0.8.5.diff)