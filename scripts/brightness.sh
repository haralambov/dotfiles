#!/bin/bash

COMMAND=$1
if [ $COMMAND == "--inc" ]; then
    $(brightnessctl set 10%+)
elif [ $COMMAND == "--dec" ]; then
    $(brightnessctl set 10%-)
fi

# update the block value
# 34 + the signal number
kill -45 $(pidof dwmblocks)
