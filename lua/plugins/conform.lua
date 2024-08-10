--- `autoformat.lua`: Configuration for autoformatting in Neovim using `conform.nvim`.
-- This file sets up the following features:
-- 1. **Autoformatting on Save**: Configures automatic code formatting when saving files,
--    with the ability to toggle this feature on and off using a keybinding.
--    - **Keybinding**: Use `<leader>tq` to toggle autoformatting on save.
--    - **Manual Formatting**: You can manually trigger formatting with `<leader>d`.
-- 2. **Formatter Configuration**: Specifies different formatters for various file types, such as `stylua` for Lua.
--    - **Conditional Formatting**: Disables LSP-based formatting for certain file types (e.g., C and C++),
--      based on whether format on save is enabled.
-- 3. **Customizable Formatting Behavior**: Allows you to customize the formatters and the conditions under which they run.

local format_on_save_enabled = false -- Start with format on save disabled

local function toggle_format_on_save()
	format_on_save_enabled = not format_on_save_enabled
	if format_on_save_enabled then
		print("Format on save enabled")
	else
		print("Format on save disabled")
	end
end

return {
	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>d",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format",
			},
			{
				"<leader>tq",
				toggle_format_on_save,
				mode = "n",
				desc = "Toggle Format on Save",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Check if format on save is enabled
				if not format_on_save_enabled then
					return false
				end

				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				-- You can use 'stop_after_first' to run the first available formatter from the list
				-- javascript = { "prettierd", "prettier", stop_after_first = true },
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et
