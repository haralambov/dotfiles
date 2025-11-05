#!/bin/bash

# map neovim config
if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir "$HOME/.config/nvim"
else
    rm "$HOME/.config/nvim/init.lua"
    rm "$HOME/.config/nvim/lua"
fi

ln -s "$PWD/config/nvim/init.lua" "$HOME/.config/nvim/init.lua"
ln -s "$PWD/config/nvim/lua" "$HOME/.config/nvim/lua"

# map zshrc config
if [ -f "$HOME/.zshrc" ]; then
    rm "$HOME/.zshrc"
fi

ln -s "$PWD/config/shell/zshrc" "$HOME/.zshrc"

# map tmux config
if [ ! -d "$HOME/.config/tmux" ]; then
    mkdir "$HOME/.config/tmux"
fi
if [ -f "$HOME/.config/tmux/tmux.conf" ]; then
    rm "$HOME/.config/tmux/tmux.conf"
fi

ln -s "$PWD/config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

# map gnupg agent config
if [ ! -d "$HOME/.gnupg" ]; then
    mkdir "$HOME/.gnupg"
fi
if [ -f "$HOME/.gnupg/gpg-agent.conf" ]; then
    rm "$HOME/.gnupg/gpg-agent.conf"
fi

ln -s "$PWD/config/gnupg/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"
