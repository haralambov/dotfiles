#!/bin/bash

sleep 0.5
PROCESSES=$(xdotool search --class 'spotify')
if [ -z "$PROCESSES" ]
then
    echo " "
    exit
fi

for PROCESS_NUMBER in $PROCESSES
do
    NAME=$(xdotool getwindowname $PROCESS_NUMBER)
    if [ "$NAME" == "spotify" ]
    then
        continue
    fi
    if [[ "$NAME" != "spotify" && "$NAME" != "Spotify Premium" ]]
    then
        echo " $NAME"
    else
        echo " "
    fi
done
