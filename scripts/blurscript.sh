#! /bin/bash

IMAGE=~/.snapshot.tmp
#IMAGEP=/tmp/lsp.png # problematic after hibernating

grim "$IMAGE"

#convert "$IMAGE" -blur 5x1 "$IMAGE"
#ffmpeg -i "$IMAGE" -vf "gblur=sigma=10" "$IMAGEP"
#mv "$IMAGEP" "$IMAGE"
convert "$IMAGE" -filter Gaussian -resize 50% -define filter:sigma=2.5 -resize 200% "$IMAGE"

swaylock -u -e -f -i "$IMAGE"
