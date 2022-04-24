#!/bin/bash

nitrogen --restore
xsetroot -cursor_name arrow

# Daemons

xset -dpms && setterm -blank 0 -powerdown 0 && xset s off &
udiskie -c ~/.config/udiskie/config.yml &
picom --vsync -D 1 -I 0.017 -O 0.017 -i 100 -e 1 -m 1 -c -r 14 --config ~/.config/picom/picom.conf &
