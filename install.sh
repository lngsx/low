#!/usr/bin/env bash
set -euo pipefail

RAW="https://raw.githubusercontent.com/lngsx/low/main"

curl -fsSL "$RAW/vimrc"   -o "$HOME/.vimrc"
curl -fsSL "$RAW/aliases" -o "$HOME/.bash_aliases"

# vim-plug manager (single file, required for the plugins in ~/.vimrc)
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if ! grep -q 'bash_aliases' "$HOME/.bashrc"; then
  printf '\n[ -f ~/.bash_aliases ] && . ~/.bash_aliases\n' >> "$HOME/.bashrc"
fi

echo "dotfiles installed."
