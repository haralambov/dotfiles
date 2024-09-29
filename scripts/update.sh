#!/bin/bash
if [ -f /var/lib/pacman/db.lck ]; then
    echo "n/a"
else
    echo $(yay -Syy > /dev/null && yay -Qu | wc -l)
fi
