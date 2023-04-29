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

if [ -f "$HOME/.p10k.zsh" ]; then
    rm "$HOME/.p10k.zsh"
fi

ln -s "$PWD/config/shell/.p10k.zsh" "$HOME/.p10k.zsh"

# map tmux config
if [ -f "$HOME/.config/tmux/tmux.conf" ]; then
    rm "$HOME/.config/tmux/tmux.conf"
fi

ln -s "$PWD/config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

