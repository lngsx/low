#!/usr/bin/env bash
set -euo pipefail

RAW="https://raw.githubusercontent.com/lngsx/low/main"

curl -fsSL "$RAW/vimrc"   -o "$HOME/.vimrc"
curl -fsSL "$RAW/aliases" -o "$HOME/.bash_aliases"

if ! grep -q 'bash_aliases' "$HOME/.bashrc"; then
  printf '\n[ -f ~/.bash_aliases ] && . ~/.bash_aliases\n' >> "$HOME/.bashrc"
fi

echo "dotfiles installed."
