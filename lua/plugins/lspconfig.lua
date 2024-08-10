--- `lsp_config.lua`: Configuration for setting up Language Server Protocol (LSP) support in Neovim.
-- This file sets up and configures various plugins for LSP support, including automatic LSP installation,
-- integration with Neovim's built-in LSP client, and additional features like inlay hints, code actions,
-- and more.
--
-- Features:
-- 1. **Lazydev.nvim**: Enhances Lua development in Neovim by providing LSP features specific to Neovim's runtime and plugins.
-- 2. **Mason.nvim**: Manages and installs LSP servers, linters, and formatters.
-- 3. **nvim-lspconfig**: Configures and sets up LSP servers.
-- 4. **Fidget.nvim**: Displays LSP status updates in a minimal UI.
-- 5. **Keybindings**: Provides key mappings for common LSP actions such as go-to-definition, find references, rename, and more.

return {
	{
		-- Lua LSP configuration for Neovim development
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } }, -- Load luvit types when 'vim.uv' is found
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true }, -- Provides Lua meta types for LSP
	{
		-- Main LSP configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true }, -- Manages LSP installations
			"williamboman/mason-lspconfig.nvim", -- Bridges Mason and LSPconfig
			"WhoIsSethDaniel/mason-tool-installer.nvim", -- Installs additional tools via Mason
			{ "j-hui/fidget.nvim", opts = {} }, -- Provides a minimal LSP status UI
			"hrsh7th/cmp-nvim-lsp", -- Integrates LSP with nvim-cmp for autocompletion
		},
		config = function()
			-- Setup autocommands for LSP attachment and inlay hints
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- Key mappings for common LSP actions
					map("gd", require("telescope.builtin").lsp_definitions, "Goto definition")
					map("gr", require("telescope.builtin").lsp_references, "Goto references")
					map("gi", require("telescope.builtin").lsp_implementations, "Goto implementation")
					map("<leader>rn", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
					map("gD", vim.lsp.buf.declaration, "Goto Declaration")

					-- Highlight word under cursor when idle
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.document_highlight,
						})
						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = vim.lsp.buf.clear_references,
						})
					end
					-- Toggle inlay hints if supported by the LSP
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map("<leader>th", function()
							vim.lsp.inlay_hint.toggle()
						end, "Toggle inlay hints")
					end
				end,
			})

			-- Enhance LSP capabilities with nvim-cmp
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Configure LSP servers
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			}

			-- Setup Mason for managing LSP installations
			require("mason").setup()

			-- Install LSP servers and tools via Mason
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, { "stylua" }) -- Add additional tools to install
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			-- Setup Mason-LSPconfig and configure LSP servers
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
