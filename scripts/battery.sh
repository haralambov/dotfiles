#!/bin/bash

IS_POWER_PLUGGED=$(cat /sys/class/power_supply/AC0/online)
BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)

if [[ $IS_POWER_PLUGGED == 1 ]]; then
    if [[ $BATTERY_LEVEL -lt 90 ]]; then
        echo " AC ($BATTERY_LEVEL %)"
    else
        echo " AC"
        exit
    fi
fi

echo " $BATTERY_LEVEL %"

