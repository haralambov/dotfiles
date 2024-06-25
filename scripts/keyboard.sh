#!/bin/bash

# Maps the Caps Lock to behave like Escape if pressed once,
# and as Control if combined with something else
setxkbmap -option; setxkbmap -option "ctrl:nocaps" -option grp:ctrls_toggle,grp_led:scroll us,bg -variant ,phonetic -option altwin:swap_alt_win
xcape -e 'Control_L=Escape' -t 175
