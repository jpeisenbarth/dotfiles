#!/bin/bash
xdotool keyup shift keyup super keyup l key XF86AudioPlay
xdg-screensaver lock; systemctl -i suspend
exit 0
