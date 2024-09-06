#!/bin/bash

$(yay -Syy > /dev/null)
PACKAGES_LIST=$(yay -Qu)

if [ -z "${PACKAGES_LIST}" ]; then
    echo 0
    exit
fi

echo $(echo ${PACKAGES_LIST} | wc -l)
