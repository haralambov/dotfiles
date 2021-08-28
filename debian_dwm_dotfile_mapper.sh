#!/bin/bash

# map wallpaper
if [ ! -d "$HOME/Pictures" ]; then
    mkdir "$HOME/Pictures"
fi

ln -s "$PWD/debian_wallpaper.png" "$HOME/Pictures/wallpaper.png"
# map neovim config
if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir "$HOME/.config/nvim"
else
    rm "$HOME/.config/nvim/init.vim"
fi

ln -s "$PWD/nvim/init.vim" "$HOME/.config/nvim/init.vim"

# map bashrc config
if [ -f "$HOME/.bashrc" ]; then
    rm "$HOME/.bashrc"
fi

ln -s "$PWD/.bashrc" "$HOME/.bashrc"

# # map scripts
# if [ ! -d "$HOME/.scripts" ]; then
#     mkdir "$HOME/.scripts"
# else
#     rm -rf "$HOME/.scripts/*.sh"
# fi
# 
# ln -s "$PWD/scripts/battery.sh" "$HOME/.scripts/battery.sh"
# ln -s "$PWD/scripts/brightness.sh" "$HOME/.scripts/brightness.sh"
# ln -s "$PWD/scripts/language.sh" "$HOME/.scripts/language.sh"
# ln -s "$PWD/scripts/lock.sh" "$HOME/.scripts/lock.sh"
# ln -s "$PWD/scripts/notifications.sh" "$HOME/.scripts/notifications.sh"
# ln -s "$PWD/scripts/spotify.sh" "$HOME/.scripts/spotify.sh"

