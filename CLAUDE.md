# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

A dotfiles repository for macOS (and partially Linux/Windows). Files here are symlinked into `$HOME` via [dotbot](https://github.com/anishathalye/dotbot). The repo root effectively mirrors the home directory layout.

## Installing / Applying Changes

```bash
./install          # runs dotbot to create/refresh symlinks per install.conf.yaml
git submodule update --init --recursive   # update dotbot and tmux plugins
```

After editing any config, the symlink is already live — no re-install needed unless adding a new symlink entry to `install.conf.yaml`.

To update installed tools (npm, Rust, Python packages, Homebrew):
```bash
python mbin/update-tools.py
```

## Repository Structure

- `install.conf.yaml` — dotbot symlink declarations; edit here when adding new dotfiles
- `.config/nvim/` — Neovim config in Lua (see below)
- `.config/alacritty/` — `alacritty.toml` (current) + `alacritty.yml` (Windows fallback)
- `.config/lua/stylua.toml` — stylua formatter config (referenced from nvim lsp.lua)
- `.config/python/requirements.txt` — Python packages managed by update-tools.py
- `.tmux.conf` + `.tmux/` — tmux config with TPM plugins
- `.zshrc` / `.bashrc` / `.bash_login` — shell configs (macOS/Linux)
- `profile.ps1` / `install.ps1` — Windows PowerShell equivalents
- `mbin/` — personal scripts added to `$PATH` (`~/mbin`)
- `Library/Developer/Xcode/UserData/` — Xcode themes

## Neovim Config Architecture (`.config/nvim/`)

Entry point is `init.lua`, which sets global options then `require()`s each module:

| Module | Purpose |
|---|---|
| `lua/plugins.lua` | packer.nvim declarations; auto-resyncs on save |
| `lua/lsp.lua` | LSP servers: `sumneko_lua`, `rust_analyzer`; null-ls formatters: stylua, gofmt, black, rustfmt, shfmt |
| `lua/treesitter.lua` | Tree-sitter parsers + textobjects |
| `lua/completion.lua` | nvim-cmp setup with luasnip |
| `lua/keymaps.lua` | which-key bindings; leader is `<Space>` |
| `lua/tree.lua` | nvim-tree file explorer |
| `lua/buffers.lua` | bufferline setup |
| `lua/finder.lua` | Telescope + fzf-native extension |
| `lua/utils.lua` | `P()` helper for inspecting Lua values |

Theme: `nordfox` (nightfox.nvim). Plugin manager: packer.nvim — run `:PackerSync` after editing `plugins.lua` (also triggers automatically on `BufWritePost plugins.lua`).

## Shell Aliases to Know

The `.zshrc` replaces several standard tools:

| Alias | Actual command |
|---|---|
| `vim` | `nvim` |
| `cat` | `bat` |
| `find` | `fd -HIl` |
| `tree` | `br -i` (broot) |
| `sed` | `sd` |
| `diff` | `difft` |
| `top` | `glances` |
| `du` / `df` | `dust` / `duf` |
| `ll` | `exa -la` |

## Tmux

Prefix is `C-a`. Plugins managed via TPM (`.tmux/plugins/tpm`): sensible, yank, resurrect. Reload config with `<prefix> r`.

## Git

`~/.gitconfig` uses `delta` as the pager with side-by-side diffs. `GIT_EDITOR` and `EDITOR` are set to `nvim`.

## Adding a New Dotfile

1. Place the file/directory in the repo at the appropriate path.
2. Add a `link:` entry in `install.conf.yaml` mapping `~/target: repo/source`.
3. Run `./install` to create the symlink.
4. Add a `if:` condition if the config is platform-specific (see existing entries for examples).
