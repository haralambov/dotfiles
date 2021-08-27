#!/bin/bash

TEMP_FILE=/tmp/notification

if [ -f "$TEMP_FILE" ]; then
    rm $TEMP_FILE
    echo ""
    killall -SIGUSR2 dunst
else
    touch $TEMP_FILE
    echo ""
    killall -SIGUSR1 dunst
fi
