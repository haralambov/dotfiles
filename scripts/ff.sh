#!/bin/bash

selected_file=$(fzf --preview='bat --style=numbers --color=always {}' --bind shift-up:preview-page-up,shift-down:preview-page-down)

if [ ! -z $selected_file ]; then
    nvim $selected_file
fi
