#!/bin/bash

selected_files=$(fzf -m --preview='bat --style=numbers --color=always {}' --bind shift-up:preview-page-up,shift-down:preview-page-down)

if [[ ! -z ${selected_files} ]]; then
    nvim $selected_files
fi
