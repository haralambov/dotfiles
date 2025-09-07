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

# map i3 config
if [ ! -d "$HOME/.config/i3" ]; then
    mkdir "$HOME/.config/i3"
fi
if [ -f "$HOME/.config/i3/config" ]; then
    rm "$HOME/.config/i3/config"
fi

ln -s "$PWD/config/i3/config" "$HOME/.config/i3/config"

# map picom config
if [ ! -d "$HOME/.config/picom" ]; then
    mkdir "$HOME/.config/picom"
fi
if [ -f "$HOME/.config/picom/picom.conf" ]; then
    rm "$HOME/.config/picom/picom.conf"
fi

ln -s "$PWD/config/picom/picom.conf" "$HOME/.config/picom/picom.conf"

# map alacritty config
if [ ! -d "$HOME/.config/alacritty" ]; then
    mkdir "$HOME/.config/alacritty"
fi
if [ -f "$HOME/.config/alacritty/alacritty.toml" ]; then
    rm "$HOME/.config/alacritty/alacritty.toml"
fi
if [ -f "$HOME/.config/alacritty/catppuccin-mocha.toml" ]; then
    rm "$HOME/.config/alacritty/catppuccin-mocha.toml"
fi

ln -s "$PWD/config/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
ln -s "$PWD/config/alacritty/catppuccin-mocha.toml" "$HOME/.config/alacritty/catppuccin-mocha.toml"

# map ranger config
if [ ! -d "$HOME/.config/ranger" ]; then
    mkdir "$HOME/.config/ranger"
fi
if [ -f "$HOME/.config/ranger/rc.conf" ]; then
    rm "$HOME/.config/ranger/rc.conf"
fi

ln -s "$PWD/config/ranger/rc.conf" "$HOME/.config/ranger/rc.conf"

# map dunst config
if [ ! -d "$HOME/.config/dunst" ]; then
    mkdir "$HOME/.config/dunst"
fi
if [ -f "$HOME/.config/dunst/dunstrc" ]; then
    rm "$HOME/.config/dunst/dunstrc"
fi

ln -s "$PWD/config/dunst/dunstrc" "$HOME/.config/dunst/dunstrc"
