#!/usr/bin/env bash
set -euo pipefail

RAW_BASE_URL="https://raw.githubusercontent.com/lngsx/low/main"

# download dotfiles to $HOME
curl -fsSL "$RAW_BASE_URL/vimrc"     -o "$HOME/.vimrc"
curl -fsSL "$RAW_BASE_URL/aliases"   -o "$HOME/.bash_aliases"
curl -fsSL "$RAW_BASE_URL/tmux.conf" -o "$HOME/.tmux.conf"

# install vim-plug plugin manager (single file, required for the plugins in ~/.vimrc)
curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install TPM (tmux plugin manager) if missing, then install the plugins
# declared in ~/.tmux.conf. Non-interactive: no live tmux session required.
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
"$HOME/.tmux/plugins/tpm/bin/install_plugins"

# source aliases in .bashrc if not already present
if ! grep -q 'bash_aliases' "$HOME/.bashrc"; then
  printf '\n[ -f ~/.bash_aliases ] && . ~/.bash_aliases\n' >> "$HOME/.bashrc"
fi

echo -e "✓ dotfiles installed."
