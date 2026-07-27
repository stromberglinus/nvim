.PHONY: \
	setup \
	install-tools install-apt-tools install-node-tools install-python-tools install-rust-tools install-lua-ls \
	nvim-bootstrap nvim-update nvim-clean nvim-check nvim-setup obsidian-dirs

NVIM ?= nvim

INSTALL_DIR := $(HOME)/.local/bin
LSP_DATA_DIR := $(HOME)/.local/share/nvim-lsp

OBSIDIAN_BASE := $(HOME)/workspace/ObsidianVaults
OBSIDIAN_PERSONAL := $(OBSIDIAN_BASE)/personal
OBSIDIAN_WORK := $(OBSIDIAN_BASE)/work

setup: install-tools nvim-setup
	@echo "✓ Full setup complete"

install-tools: install-apt-tools install-node-tools install-python-tools install-rust-tools install-lua-ls
	@echo "✓ External tools installed"

install-apt-tools:
	@echo "Installing apt tools..."
	sudo apt update
	sudo apt install -y \
		build-essential \
		git \
		make \
		curl \
		wget \
		unzip \
		ripgrep \
		fd-find \
		fzf \
		xclip \
		clangd \
		clang-format \
		gdb \
		cmake \
		npm \
		pipx
	@mkdir -p "$(INSTALL_DIR)"
	@if command -v fdfind >/dev/null 2>&1; then ln -sf "$$(command -v fdfind)" "$(INSTALL_DIR)/fd"; fi
	@echo "✓ apt tools installed"

install-node-tools:
	@echo "Installing Node LSPs/formatters..."
	npm install -g \
		typescript \
		typescript-language-server \
		prettier \
		@fsouza/prettierd \
		eslint \
		eslint_d \
		markdownlint-cli \
		fixjson \
		stylelint \
		bash-language-server \
		yaml-language-server \
		dockerfile-language-server-nodejs \
		vscode-langservers-extracted
	@echo "✓ Node tools installed"

install-python-tools:
	@echo "Installing Python LSPs/debug tools..."
	pipx install basedpyright || pipx upgrade basedpyright
	pipx install cmake-language-server || pipx upgrade cmake-language-server
	pipx install debugpy || pipx upgrade debugpy
	@echo "✓ Python tools installed"

install-rust-tools:
	@echo "Installing Rust/Cargo tools..."
	@command -v cargo >/dev/null 2>&1 || (echo "❌ cargo not found. Install rustup first:" && echo "   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh" && exit 1)
	cargo install stylua --force
	cargo install --git https://github.com/tekumara/typos-lsp --locked typos-lsp --force
	cargo install tree-sitter-cli --force
	cargo install git-delta --force
	cargo install fd-find --force
	@echo "✓ Rust tools installed"

install-lua-ls:
	@echo "Installing lua-language-server..."
	@mkdir -p "$(LSP_DATA_DIR)/lua-ls"
	@cd "$(LSP_DATA_DIR)/lua-ls" && \
		wget -q --show-progress https://github.com/LuaLS/lua-language-server/releases/download/3.15.0/lua-language-server-3.15.0-linux-x64.tar.gz -O lua-ls.tar.gz && \
		tar -xzf lua-ls.tar.gz && \
		rm lua-ls.tar.gz
	@mkdir -p "$(INSTALL_DIR)"
	@ln -sf "$(LSP_DATA_DIR)/lua-ls/bin/lua-language-server" "$(INSTALL_DIR)/lua-language-server"
	@echo "✓ lua-language-server installed"

obsidian-dirs:
	@echo "Creating Obsidian vault directories..."
	@mkdir -p "$(OBSIDIAN_PERSONAL)"
	@mkdir -p "$(OBSIDIAN_WORK)"
	@echo "✓ Obsidian directories ready"
	@echo "  personal: $(OBSIDIAN_PERSONAL)"
	@echo "  work:     $(OBSIDIAN_WORK)"

nvim-bootstrap: obsidian-dirs
	@echo "Installing/updating Neovim packages with vim.pack..."
	@$(NVIM) --headless "+lua require('core.pack')" "+qa"
	@echo "✓ Neovim packages bootstrapped"

nvim-update: obsidian-dirs
	@echo "Updating Neovim packages..."
	@$(NVIM) --headless "+lua require('core.pack')" "+lua vim.pack.update(nil, { confirm = false })" "+qa"
	@echo "✓ Neovim packages updated"

nvim-clean:
	@echo "Removing Neovim Lua cache..."
	@rm -rf "$(HOME)/.cache/nvim/luac"
	@echo "✓ Neovim Lua cache removed"

nvim-check:
	@echo "Checking Neovim and required tools..."
	@command -v $(NVIM) >/dev/null 2>&1 || (echo "❌ nvim not found" && exit 1)
	@command -v git >/dev/null 2>&1 || (echo "❌ git not found" && exit 1)
	@command -v cc >/dev/null 2>&1 || (echo "❌ C compiler not found. Install with: sudo apt install build-essential" && exit 1)
	@command -v tree-sitter >/dev/null 2>&1 || echo "⚠ tree-sitter CLI not found"
	@command -v rg >/dev/null 2>&1 || echo "⚠ rg not found"
	@command -v fd >/dev/null 2>&1 || echo "⚠ fd not found"
	@command -v fzf >/dev/null 2>&1 || echo "⚠ fzf not found"
	@command -v lua-language-server >/dev/null 2>&1 || echo "⚠ lua-language-server not found"
	@command -v clangd >/dev/null 2>&1 || echo "⚠ clangd not found"
	@command -v basedpyright >/dev/null 2>&1 || echo "⚠ basedpyright not found"
	@command -v typescript-language-server >/dev/null 2>&1 || echo "⚠ typescript-language-server not found"
	@command -v typos-lsp >/dev/null 2>&1 || echo "⚠ typos-lsp not found"
	@command -v stylua >/dev/null 2>&1 || echo "⚠ stylua not found"
	@command -v clang-format >/dev/null 2>&1 || echo "⚠ clang-format not found"
	@command -v prettier >/dev/null 2>&1 || echo "⚠ prettier not found"
	@command -v prettierd >/dev/null 2>&1 || echo "⚠ prettierd not found"
	@command -v eslint_d >/dev/null 2>&1 || echo "⚠ eslint_d not found"
	@command -v markdownlint >/dev/null 2>&1 || echo "⚠ markdownlint not found"
	@command -v fixjson >/dev/null 2>&1 || echo "⚠ fixjson not found"
	@command -v delta >/dev/null 2>&1 || echo "⚠ delta not found"
	@echo "✓ Basic check complete"

nvim-setup: nvim-check nvim-clean obsidian-dirs nvim-bootstrap
	@echo "✓ Neovim setup complete"
