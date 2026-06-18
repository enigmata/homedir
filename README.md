# homedir

Personal dotfiles managed with [dotbot](https://github.com/anishathalye/dotbot). Files are symlinked from this repo into `$HOME`.

## Install

**Prerequisites (macOS):**

```bash
# 1. Xcode Command Line Tools (provides git and python3)
xcode-select --install

# 2. Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 3. Core tools used by the shell configs themselves
brew install neovim eza bat fd broot sd diffutils dust duf glances fzf git-delta tmux ripgrep the_silver_searcher lua-language-server stylua rust-analyzer shfmt
```

**Then clone and link:**

```bash
git clone --recursive git@github.com:enigmata/homedir.git
cd homedir
./install
```

`--recursive` pulls dotbot and the tmux plugin submodules. Re-running `./install` is safe and will refresh symlinks.

## What's included

| Config | Location |
|---|---|
| Zsh | `.zshrc` |
| Bash | `.bash_login`, `.bashrc`, `.bash_completion` |
| Neovim | `.config/nvim/` |
| Tmux | `.tmux.conf`, `.tmux/` |
| Alacritty | `.config/alacritty/alacritty.toml` |
| Git | `.gitconfig` |
| Scripts | `mbin/` → `~/mbin/` (on `$PATH`) |

## Keeping tools updated

```bash
python mbin/update-tools.py
```

Updates Homebrew, npm globals, Rust toolchain, and Python packages in one shot.

## Neovim

Plugin manager: [packer.nvim](https://github.com/wbthomason/packer.nvim). On first launch run `:PackerSync`. Leader key is `<Space>` — press it to see all bindings via which-key.

## Tmux

Prefix is `C-a`. Plugins managed via [TPM](https://github.com/tmux-plugins/tpm): on first launch press `<prefix> I` to install them.

## Platform notes

- **macOS (primary):** Homebrew is auto-detected at `/opt/homebrew` (Apple Silicon) or `/usr/local` (Intel).
- **Linux:** Linuxbrew paths and `.local/bin` are added automatically.
- **Windows:** `install.ps1` handles PowerShell profile and Alacritty config via `profile.ps1` and `.config/winterminal/`.
