#!/bin/bash

COMMAND=$1
if [ $COMMAND == "--inc" ]; then
    $(pactl set-sink-volume 0 +5%)
    $(pactl set-sink-mute 0 0)
elif [ $COMMAND == "--dec" ]; then
    $(pactl set-sink-volume 0 -5%)
elif [ $COMMAND == "--mute" ]; then
    $(pactl set-sink-volume 0 0%)
    $(pactl set-sink-mute 0 toggle)
fi

# update the block value
# 34 + the signal number
kill -46 $(pidof dwmblocks)
