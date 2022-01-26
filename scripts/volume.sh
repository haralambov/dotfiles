#!/bin/bash

ARGUMENT=$1
if [ "$ARGUMENT" = "--inc" ]; then
    pulsemixer --change-volume +5
elif [ "$ARGUMENT" = "--dec" ]; then
    pulsemixer --change-volume -5
elif [ "$ARGUMENT" = "--mute" ]; then
    pulsemixer --toggle-mute
else
    MUTE=$(pulsemixer --get-mute)
    if [ $MUTE -eq 0 ]; then
        VOLUME_LEVEL=$(pulsemixer --get-volume | awk '{print $1}')
        echo -e " $VOLUME_LEVEL"
    else
        echo -e ""
    fi
fi

# Needed for dwmblocks
# update the block value
# 34 + the signal number
# kill -46 $(pidof dwmblocks)
