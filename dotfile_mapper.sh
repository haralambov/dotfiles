#!/bin/bash

# map neovim config
if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir "$HOME/.config/nvim"
else
    rm "$HOME/.config/nvim/init.lua"
    rm "$HOME/.config/nvim/lua"
fi

ln -s "$PWD/nvim/init.lua" "$HOME/.config/nvim/init.lua"
ln -s "$PWD/nvim/lua" "$HOME/.config/nvim/lua"

# map bashrc config
if [ -f "$HOME/.bashrc" ]; then
    rm "$HOME/.bashrc"
fi

ln -s "$PWD/.bashrc" "$HOME/.bashrc"

## map compton config
#if [ -f "$HOME/.config/compton.conf" ]; then
#    rm "$HOME/.config/compton.conf"
#fi
#
#ln -s "$PWD/config/compton/compton.conf" "$HOME/.config/compton.conf"
#
## maps touchpad config, that enables tap to click
#if [ -f "/etc/X11/xorg.conf.d/40-libinput.conf" ]; then
#    sudo rm "/etc/X11/xorg.conf.d/40-libinput.conf"
#fi
#
#sudo ln -s "$PWD/config/touchpad/40-libinput.conf" "/etc/X11/xorg.conf.d/40-libinput.conf"
#
#if [ -f "/usr/local/bin/locker" ]; then
#    sudo rm "/usr/local/bin/locker"
#fi
#
#sudo ln -s "$PWD/scripts/locker" "/usr/local/bin/locker"
#
#if [ -f "/usr/local/bin/passmenu" ]; then
#    sudo rm "/usr/local/bin/passmenu"
#fi
#
#sudo ln -s "$PWD/scripts/passmenu" "/usr/local/bin/passmenu"
#
## maps newsboat RSS reader config
#if [ ! -d "$HOME/.newsboat" ]; then
#    mkdir "$HOME/.newsboat"
#else
#    rm "$HOME/.newsboat/urls"
#    rm "$HOME/.newsboat/config"
#fi
#
#ln -s "$PWD/config/newsboat/config" "$HOME/.newsboat/config"
#ln -s "$PWD/config/newsboat/urls" "$HOME/.newsboat/urls"
#
