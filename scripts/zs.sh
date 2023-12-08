#!/bin/bash

zellij_sessions=$(zellij list-sessions)
if [[ $? -ne 0 ]]; then
    # List command failed. No existing sessions. Creating a new one
    zellij attach --create
    exit
fi

selected_session=$(echo $zellij_sessions | fzf --ansi)

if [[ -z ${selected_session} ]]; then
    if [[ -z $ZELLIJ ]]; then
        # create a new session if
        zellij attach --create
        exit
    fi
fi

session_name=$(echo $selected_session | awk '{print $1}')

if [[ -z ${session_name} ]]; then
    echo "No or invalid session name"
    exit
fi

if [[ ! -z $ZELLIJ ]]; then
    # Zellij session is currently active
    echo "Cannot change session! First exit the current one"
    exit
fi

zellij attach ${session_name}
