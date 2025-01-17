
xrandr --output eDP-1 --brightness 0.5
setxkbmap us -variant colemak
setxkbmap -option caps:escape

xset r rate 300 50 &
feh --bg-fill ~/Pictures/xxx.jpg &
xcompmgr &
dwmblocks &
exec /usr/local/bin/dwm
