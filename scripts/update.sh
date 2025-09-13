#!/bin/bash
if [[ -f /etc/debian_version ]]; then
    echo $(apt list --upgradeable 2>/dev/null | tail -n +2 | wc -l)
else
    if [ -f /var/lib/pacman/db.lck ]; then
        echo "n/a"
    else
        echo $(yay -Syy > /dev/null && yay -Qu | wc -l)
    fi
fi
