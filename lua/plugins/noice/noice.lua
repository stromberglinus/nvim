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

            presets = {
                bottom_search = false, -- use a classic bottom cmdline for search
                command_palette = false, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = true, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true, -- add a border to hover docs and signature help
            },
            popupmenu = {
                enabled = true,
                backend = "nui",
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
            routes = {
                {
                    filter = {
                        event = "msg_show",
                        any = {
                            { find = "%d+L, %d+B" },
                            { find = "; after #%d+" },
                            { find = "; before #%d+" },
                        },
                    },
                    view = "mini",
                },
                {
                    filter = {
                        event = "msg_show",
                        kind = "",
                        find = "written",
                    },
                    opts = { skip = true },
                },
            },
            cmdline = {
                format = {
                    git = {
                        pattern = {
                            "^:%s*Gi?t?!?%s+",
                        },
                        icon = "",
                        lang = "git",
                    },
                },
            },
            views = {
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
