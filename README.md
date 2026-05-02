# NVIM Configuration

Personal Neovim configuration targeting **Neovim 0.12+** and the built-in package manager `vim.pack`.

This config does **not** use Mason for LSP/tool installation. External language servers, formatters, linters, and CLI tools should be installed separately, either manually or through the provided `Makefile`.

## Requirements

### Required

- Neovim `0.12+`
- `git`
- `make`
- `curl`
- `wget`
- `unzip`
- C compiler: `gcc`, `clang`, or `cc`
- `tree-sitter` CLI
- `ripgrep` / `rg`
- `fd`
- `fzf`
- Clipboard tool:
  - Linux: `xclip` or `xsel`
  - WSL: `xclip`, `win32yank`, or equivalent
  - Windows: `win32yank`
- A Nerd Font, optional but recommended for icons

### Recommended external tools

The config expects some of these tools depending on which features you use:

- `lazygit`
- `delta`
- `ast-grep`
- `stylua`
- `prettier`
- `prettierd`
- `eslint`
- `eslint_d`
- `markdownlint`
- `fixjson`
- `clang-format`
- `debugpy`
- `gdb`
- `clangd`
- `lua-language-server`
- `basedpyright`
- `typescript-language-server`
- `typos-lsp`
- `cmake-language-server`
- `marksman`

## Install Neovim 0.12 on Ubuntu

The Ubuntu `apt` package may lag behind the latest stable Neovim release, so this config recommends installing the official tarball.
