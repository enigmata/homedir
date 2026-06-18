# homedir

Personal dotfiles managed with [dotbot](https://github.com/anishathalye/dotbot). Files are symlinked from this repo into `$HOME`.

## Install

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

## Dependencies

CLI tools expected to be installed (via Homebrew on macOS):

`nvim` `eza` `bat` `fd` `broot` `sd` `difftastic` `dust` `duf` `glances` `fzf` `delta` `tmux` `ripgrep` `the_silver_searcher`

Neovim LSP servers: `lua-language-server` (lua_ls), `rust-analyzer`  
Neovim formatters (via null-ls): `stylua` `gofmt` `black` `rustfmt` `shfmt`

Update everything at once:

```bash
python mbin/update-tools.py
```

## Neovim

Plugin manager: [packer.nvim](https://github.com/wbthomason/packer.nvim). On first launch run `:PackerSync`. Leader key is `<Space>` — press it to see all bindings via which-key.

## Tmux

Prefix is `C-a`. Plugins managed via [TPM](https://github.com/tmux-plugins/tpm): on first launch press `<prefix> I` to install them.

## Platform notes

- **macOS (primary):** Homebrew is auto-detected at `/opt/homebrew` (Apple Silicon) or `/usr/local` (Intel).
- **Linux:** Linuxbrew paths and `.local/bin` are added automatically.
- **Windows:** `install.ps1` handles PowerShell profile and Alacritty config via `profile.ps1` and `.config/winterminal/`.
