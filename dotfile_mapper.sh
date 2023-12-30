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
