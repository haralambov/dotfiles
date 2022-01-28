#!/bin/bash

CACHE_FILE=~/.cache/volume

ARGUMENT=$1
if [ "$ARGUMENT" = "--inc" ]; then
    pulsemixer --change-volume +5
    rm $CACHE_FILE > /dev/null
elif [ "$ARGUMENT" = "--dec" ]; then
    pulsemixer --change-volume -5
    rm $CACHE_FILE > /dev/null
elif [ "$ARGUMENT" = "--mute" ]; then
    pulsemixer --toggle-mute
    rm $CACHE_FILE > /dev/null
else
    if [ ! -f "$CACHE_FILE" ]; then
        MUTE=$(pulsemixer --get-mute)
        if [ $MUTE -eq 0 ]; then
            VOLUME_LEVEL=$(pulsemixer --get-volume | awk '{print $1}')
            echo -e " $VOLUME_LEVEL" > $CACHE_FILE
        else
            echo -e " muted" > $CACHE_FILE
        fi
    fi
    cat $CACHE_FILE
fi

