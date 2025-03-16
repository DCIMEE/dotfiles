
export PATH=$HOME/.local/bin:$PATH
export EDITOR='nvim'

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
	exec startx
fi
