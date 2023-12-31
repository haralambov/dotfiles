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

# map zshrc config
if [ -f "$HOME/.zshrc" ]; then
    rm "$HOME/.zshrc"
fi

ln -s "$PWD/config/shell/.zshrc" "$HOME/.zshrc"

# map tmux config
if [ ! -d "$HOME/.config/tmux" ]; then
    mkdir "$HOME/.config/tmux"
fi
if [ -f "$HOME/.config/tmux/tmux.conf" ]; then
    rm "$HOME/.config/tmux/tmux.conf"
fi

ln -s "$PWD/config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
