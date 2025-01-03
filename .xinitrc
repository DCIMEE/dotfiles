
xrandr --output eDP-1 --brightness 0.6
setxkbmap us -variant colemak
setxkbmap -option caps:escape

xset r rate 300 50 &
feh --bg-fill ~/Pictures/xxxx.jpg &
xcompmgr &
exec dwm
