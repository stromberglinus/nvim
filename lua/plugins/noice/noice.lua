--- `notify_noice.lua`: Configuration for enhancing Neovim's notification and messaging system.
-- This file sets up the following plugins:
-- 1. **`nvim-notify`**: A fancy notification manager for Neovim that replaces the default message UI.
--    - Features: Custom icons, compact rendering, and adjustable timeout for notifications.
-- 2. **`noice.nvim`**: Enhances the Neovim command-line, messages, and LSP UI.
--    - Features: Overrides LSP markdown rendering, customizes message routing,
--      and introduces a command palette and various views for hover, confirm, and popup windows.
--    - Keybindings: Includes several key mappings for interacting with Noice (e.g., `<leader>ql` for last message).

local icons = require("utils.icons").diagnostics
return {
    {
        "rcarriga/nvim-notify",
        cond = not vim.g.vscode,
        lazy = true,
        event = "VeryLazy",
        opts = {
            icons = {
                ERROR = icons.Error,
                WARN = icons.Warn,
                INFO = icons.Info,
            },
            render = "wrapped-compact",
            timeout = 3000,
        },
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "written",
                    },
                    opts = { skip = true },
                },
            },
            presets = {
                bottom_search = false, -- use a classic bottom cmdline for search
                command_palette = false, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = true, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
            },
            views = {
                -- Clean cmdline_popup + palette
                cmdline_popup = {
                    border = {
                        style = "none",
                        padding = { 1, 1 },
                    },
                    filter_options = {},
                    win_options = {
                        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                    },
                },
                hover = {
                    border = {
                        style = "single",
                    },
                },
                confirm = {
                    border = {
                        style = "single",
                    },
                },
                popup = {
                    border = {
                        style = "single",
                    },
                },
            },
        },
	-- stylua: ignore
  keys = {
    { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
    { "<leader>ql", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
    { "<leader>qh", function() require("noice").cmd("history") end, desc = "Noice History" },
    { "<leader>qa", function() require("noice").cmd("all") end, desc = "Noice All" },
    { "<leader>qd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
    { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
    { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
  },
    },
}
