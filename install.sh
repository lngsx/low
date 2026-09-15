#!/usr/bin/env bash
set -euo pipefail

RAW_BASE_URL="https://raw.githubusercontent.com/lngsx/low/main"

# download dotfiles to $HOME
curl -fsSL "$RAW_BASE_URL/vimrc"   -o "$HOME/.vimrc"
curl -fsSL "$RAW_BASE_URL/aliases" -o "$HOME/.bash_aliases"

# install vim-plug plugin manager (single file, required for the plugins in ~/.vimrc)
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# source aliases in .bashrc if not already present
if ! grep -q 'bash_aliases' "$HOME/.bashrc"; then
  printf '\n[ -f ~/.bash_aliases ] && . ~/.bash_aliases\n' >> "$HOME/.bashrc"
fi

echo -e "✓ dotfiles installed."
