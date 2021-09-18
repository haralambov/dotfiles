#!/bin/bash

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

# map compton config
if [ -f "$HOME/.config/compton.conf" ]; then
    rm "$HOME/.config/compton.conf"
fi

ln -s "$PWD/compton.conf" "$HOME/.config/compton.conf"
