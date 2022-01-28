#!/bin/bash

CURRENT_LANGUAGE=$(setxkbmap -query | grep -i layout | awk '{print $2}' | cut -d\, -f1)
if [[ $CURRENT_LANGUAGE == "bg" ]]
then
    $(setxkbmap -layout us,bg -variant ,phonetic)
else
    $(setxkbmap -layout bg,us -variant phonetic,)
fi

