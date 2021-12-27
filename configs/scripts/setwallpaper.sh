#!/bin/bash

RESOLUTION=$(xrandr |awk '$0 ~ "*" {print $1}')

FILE=$(readlink -f $1)

if [ ! -f "$FILE" ]; then
    echo "file: $FILE doesn't exist"
    exit 1
fi

echo $FILE > $HOME/.currentwallpaper

killall -q -w xwinwrap

xwinwrap -ov -g $RESOLUTION+0+0 -- mpv -wid WID $FILE --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --no-input-default-bindings &
