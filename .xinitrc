#!/bin/sh

xcompmgr &
dwmblocks &

xrandr --output eDP-1 --brightness 0.5
setxkbmap us -variant colemak
setxkbmap -option caps:escape

xset r rate 300 50 &
feh --bg-fill ~/Pictures/xxx.png &

exec /usr/local/bin/dwm
