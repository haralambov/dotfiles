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
if [ ! -d "$HOME/.config/tmux" ]; then
    mkdir "$HOME/.config/tmux"
fi
if [ -f "$HOME/.config/tmux/tmux.conf" ]; then
    rm "$HOME/.config/tmux/tmux.conf"
fi

ln -s "$PWD/config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

# map alacritty config
if [ ! -d "$HOME/.config/alacritty" ]; then
    mkdir "$HOME/.config/alacritty"
fi

if [ -f "$HOME/.config/alacritty/alacritty.yml" ]; then
    rm "$HOME/.config/alacritty/alacritty.yml"
fi

ln -s "$PWD/config/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"

# map gitconfig
if [ -f "$HOME/.gitconfig" ]; then
    rm "$HOME/.gitconfig"
fi

ln -s "$PWD/config/git/.gitconfig" "$HOME/.gitconfig"

# map i3 config
if [ ! -d "$HOME/.config/i3" ]; then
    mkdir "$HOME/.config/i3"
fi

if [ -f "$HOME/.config/i3/config" ]; then
    rm "$HOME/.config/i3/config"
fi
ln -s "$PWD/config/i3/config" "$HOME/.config/i3/config"
