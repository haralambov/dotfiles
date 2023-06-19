#!/usr/bin/env sh

IS_PAUSED=$(dunstctl is-paused | tr -d "[:space:]")
ICON=""

if [ "$IS_PAUSED" = "true" ]; then
    ICON=""
fi

echo "$ICON"
