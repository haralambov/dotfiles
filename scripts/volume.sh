#!/bin/bash

MUTED=$(pamixer --get-mute)
if [ "$MUTED" = 'false' ]; then
    echo -e "  $(pamixer --get-volume)"
else
    echo -e " muted"
fi
