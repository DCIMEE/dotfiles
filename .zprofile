
export PATH=$HOME/.local/bin:$PATH
export EDITOR='nvim'

# If running from tty1 start sway
[ "$(tty)" = "/dev/tty1" ] && exec sway


# if [ "$(tty)" = "/dev/tty1" ] ; then
    # Your environment variables
#    export QT_QPA_PLATFORM=wayland
#    export MOZ_ENABLE_WAYLAND=1
#    export MOZ_WEBRENDER=1
#    export XDG_SESSION_TYPE=wayland
#    export XDG_CURRENT_DESKTOP=sway
#    exec sway
# fi
