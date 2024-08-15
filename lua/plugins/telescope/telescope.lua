local ui = require("plugins.telescope.ui")

return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-telescope/telescope-project.nvim" },
            { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
            "andrew-george/telescope-themes",
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "-L",
                        "-S",
                        "--color=never",
                        "--column",
                        "--line-number",
                        "--no-heading",
                        "--with-filename",
                        "--smart-case",
                        "--trim",
                    },
                    prompt_prefix = "  ",
                    border = true,
                    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                    color_devicons = true,

                    winblend = 0,
                    layout_strategy = "vertical",

                    layout_config = ui.layouts.vertical,
                    borderchars = ui.borderchars,
                    wrap_results = false,
                    path_display = {
                        truncate = 1,
                        filename_first = {
                            reverse_directories = false,
                        },
                    },
                    selection_caret = "",
                    entry_prefix = " ",

                    -- other default settings...
                },
                pickers = {
                    colorscheme = {
                        initial_mode = "normal",
                        layout_strategy = "cursor",
                        layout_config = ui.layouts.small_cursor,
                        enable_preview = true,
                    },

                    find_files = {
                        initial_mode = "insert",
                        layout_strategy = "horizontal",
                        layout_config = ui.layouts.horizontal,
                    },
                    live_grep = {
                        -- initial_mode = "insert",
                        -- layout_strategy = "horizontal",
                        layout_config = ui.layouts.lsp,
                    },
                    -- additional pickers with UI configurations...
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(ui.layouts.small_cursor),
                    },
                    project = {
                        display_type = "full",
                        layout_config = ui.layouts.vertical,
                    },
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                        layout_config = ui.layouts.vertical,
                    },
                },
                lsp_references = {
                    initial_mode = "normal",
                    layout_config = ui.layouts.lsp,
                    layout_strategy = "vertical",
                },
                lsp_incoming_calls = {
                    initial_mode = "normal",
                    layout_config = ui.layouts.lsp,
                    layout_strategy = "vertical",
                },
                lsp_outgoing_calls = {
                    initial_mode = "normal",
                    layout_config = ui.layouts.lsp,
                    layout_strategy = "vertical",
                },
                lsp_definitions = {
                    initial_mode = "normal",
                    layout_config = ui.layouts.lsp,
                    layout_strategy = "vertical",
                },
                lsp_type_definitions = {
                    initial_mode = "normal",
                    layout_config = ui.layouts.lsp,
                    layout_strategy = "vertical",
                },
                lsp_implementations = {
                    initial_mode = "normal",
                    layout_config = ui.layouts.lsp,
                    layout_strategy = "vertical",
                },
                lsp_document_symbols = {
                    initial_mode = "normal",
                    layout_config = ui.layouts.lsp,
                    layout_strategy = "vertical",
                },
                lsp_workspace_symbols = {
                    initial_mode = "normal",
                    layout_config = ui.layouts.lsp,
                    layout_strategy = "vertical",
                },
                lsp_dynamic_workspace_symbols = {
                    initial_mode = "normal",
                    layout_config = ui.layouts.lsp,
                    layout_strategy = "vertical",
                },
                diagnostics = {
                    initial_mode = "normal",
                    layout_config = ui.layouts.lsp,
                    layout_strategy = "vertical",
                },
            })

            -- Enable extensions
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")
            pcall(require("telescope").load_extension, "project")

            -- Key mappings
            vim.keymap.set(
                "n",
                "<leader>fp",
                ":lua require'telescope'.extensions.project.project{display_type = 'full'}<cr>",
                { desc = "Find project" }
            )
        end,
    },
}
