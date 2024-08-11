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
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
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
                },
            })

            -- Enable extensions
            pcall(require("telescope").load_extension, "fzf")
            pcall(require("telescope").load_extension, "ui-select")
            pcall(require("telescope").load_extension, "project")

            -- Key mappings
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
            vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find keymaps" })
            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "Find select telescope" })
            vim.keymap.set("n", "<leader>s", builtin.grep_string, { desc = "Grep string" })
            vim.keymap.set("v", "<leader>s", builtin.grep_string, { desc = "Grep string" })
            vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Fuzzy search" })
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Find old files" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
            vim.keymap.set(
                "n",
                "<leader>fp",
                ":lua require'telescope'.extensions.project.project{display_type = 'full'}<cr>",
                { desc = "Find project" }
            )

            -- Slightly advanced example of overriding default behavior and theme
            vim.keymap.set("n", "<leader>f/", function()
                builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end, { desc = "Fuzzily search in current buffer" })

            -- Additional configuration for searching open files
            vim.keymap.set("n", "<leader>fm", function()
                builtin.live_grep({
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                })
            end, { desc = "Find in Open Files" })

            -- Shortcut for searching Neovim configuration files
            vim.keymap.set("n", "<leader>fn", function()
                builtin.find_files({ cwd = vim.fn.stdpath("config") })
            end, { desc = "Find in Neovim files" })
        end,
    },
}
