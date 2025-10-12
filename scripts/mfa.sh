#!/usr/bin/env bash

CODE=$(oathtool -b --totp $1 | tr -d '\n')
echo $CODE | ~/Projects/dotfiles/scripts/copy.sh -
