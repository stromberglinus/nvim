--- nvim-cmp configuration for autocompletion in Neovim.
-- This file sets up nvim-cmp and integrates various completion sources such as 
-- LSP, buffer, path, and Git. Additionally, it configures lspkind for adding 
-- icons to completion items, and custom sorting and matching behaviors.

return {
	{
		"hrsh7th/nvim-cmp",
		cond = not vim.g.vscode,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-path",
			"petertriho/cmp-git",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind-nvim",
		},
		config = function(_, _)
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			cmp.setup({
				-- Default settings and key mappings
				view = {
					entries = {
						follow_cursor = true,
						selection_order = "top_down",
					},
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				experimental = {
					ghost_text = true,
				},
				matching = {
					disallow_fuzzy_matching = true,
					disallow_fullfuzzy_matching = true,
					disallow_partial_fuzzy_matching = true,
					disallow_partial_matching = true,
					disallow_prefix_unmatching = false,
					disallow_symbol_nonprefix_matching = false,
				},
				sorting = {
					priority_weight = 2,
					comparators = {
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol", -- show only symbol annotations
						maxwidth = 50, -- prevent the popup from showing more than provided characters
						ellipsis_char = "...", -- character to show when text is truncated
					}),
				},
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources({
					{ name = "git" }, -- Git completion source
				}, {
					{ name = "buffer" },
				}),
			})

			-- Use buffer source for `/` and `?` (search)
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "nvim_lsp_document_symbol" },
				}, {
					{ name = "buffer" },
				}),
			})

			-- Use cmdline & path source for `:` (command line)
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})

			-- Git completions setup
			require("cmp_git").setup()
		end,
	},
}
