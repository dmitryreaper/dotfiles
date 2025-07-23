#!/bin/sh

exec /home/dima/Source/dotfiles/scripts/money.sh | awk '{print $1 "/" $2}'
