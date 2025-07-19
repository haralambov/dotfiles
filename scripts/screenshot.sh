#!/bin/bash

# take a screenshot and directly copy it to the clipboard
# without saving it to a file
scrot -fs - | xclip -selection clipboard -target image/png -i
