# Agent Guide — low

## What This Project Is

**low** is a minimal set of dotfiles for remote VMs. These files get deployed to a remote machine to make file editing and navigation less painful. This is NOT the user's main machine setup.

These VMs are serving actual workloads. The editor must not compete for resources. Any plugin, dependency, or feature that adds CPU, memory, or disk overhead gets cut — no matter how convenient. When in doubt, leave it out.

The entire project is just five files:

| File | Purpose |
|------|---------|
| `vimrc` | Minimal Vim config with vim-plug, fzf, and sane defaults |
| `tmux.conf` | Minimal tmux config with TPM-managed plugins |
| `aliases` | A few bash shortcuts (`..`, `...`, `qa`) |
| `install.sh` | One-liner to deploy dotfiles onto a remote VM |
| `README.md` | Usage instructions |

## Rules

1. **Everything you need is in this repo.** Do not explore the local machine's Vim, NeoVim, tmux, bash config, or any other system configuration. The only config files that matter are the ones in this directory.

2. **Keep it minimal.** Every addition must justify itself for a remote editing session. If it costs resources or adds dependencies, push back first — explain the tradeoff clearly. If the user still wants it, that's their call.

3. **The install script is the deployment mechanism.** If you add a new file (e.g., a new dotfile), update `install.sh` to deploy it. If you rename a file, update `install.sh` accordingly.

4. **Don't add complexity.** No elaborate keybinding schemes. No language-server setups. If the user wants that, it belongs in their main config, not here.
