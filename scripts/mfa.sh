#!/usr/bin/env bash

CODE=$(oathtool -b --totp $1)
echo $CODE | tee /dev/tty | tr -d '\n' | xclip -sel clip -i
