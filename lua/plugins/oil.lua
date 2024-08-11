--- `oil_explorer.lua`: Configuration for `oil.nvim`, alternative file explorer for Neovim.
-- This file sets up the following features:
-- 1. **Directory Navigation**: Automatically changes the working directory if a directory is opened via command-line arguments.
-- 2. **Keybindings**: Provides a set of key mappings to interact with the file explorer, including opening files, splitting windows, previewing files, and toggling hidden files.
--    - **Keybindings**:
--      - `<leader>e`: Opens the file explorer.
--      - `<leader>E`: Opens the file explorer at the current working directory.
-- 3. **UI Customization**: Configures the look and feel of the explorer with options like icons, floating windows, and handling of hidden files.
-- 4. **Floating Window Options**: Specifies how the floating windows (used for preview, progress, etc.) are displayed, including their size, border, and transparency.

return {
    {
        "stevearc/oil.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- Adds file type icons to the explorer
        },
        init = function()
            -- Automatically change the working directory if the argument is a directory
            if vim.fn.argc() == 1 then
                local arg = vim.fn.argv(0)
                local stat = vim.uv.fs_stat(arg)
                if stat and stat.type == "directory" then
                    vim.cmd.chdir(arg)
                end
            end
        end,
        event = "VimEnter",
        keys = {
            { "g?", desc = "Show Help" },
            { "<CR>", desc = "Select" },
            { "<C-v>", desc = "Vertical split" },
            { "<C-x>", desc = "Horizontal split" },
            { "<C-t>", desc = "New tab" },
            { "<C-p>", desc = "Preview" },
            { "<C-c>", desc = "Close" },
            { "-", desc = "Parent" },
            { "_", desc = "CWD" },
            { "`", desc = "cd" },
            { "~", desc = "tcd" },
            { "g.", desc = "Toggle Hidden" },
            {
                "<leader>e",
                function()
                    require("oil").open()
                end,
                desc = "Explorer",
            },
            {
                "<leader>E",
                function()
                    require("oil").open(vim.uv.cwd())
                end,
                desc = "Explorer (CWD)",
            },
        },
        opts = {
            columns = {
                "icon", -- Display file icons in the explorer
            },
            default_file_explorer = true, -- Replace default file explorer with Oil
            restore_win_options = true, -- Restore window options after closing Oil
            skip_confirm_for_simple_edits = false,
            delete_to_trash = false,
            promt_save_on_select_new_entry = true,
            keymaps = {
                ["g?"] = "actions.show_help",
                ["<CR>"] = "actions.select",
                ["<C-v>"] = "actions.select_vsplit",
                ["<C-x>"] = "actions.select_split",
                ["<C-t>"] = "actions.select_tab",
                ["<C-p>"] = "actions.preview",
                ["<C-c>"] = "actions.close",
                ["-"] = "actions.parent",
                ["_"] = "actions.open_cwd",
                ["`"] = "actions.cd",
                ["~"] = "actions.tcd",
                ["g."] = "actions.toggle_hidden",
            },
            use_default_keymaps = false, -- Disable default key mappings
            view_options = {
                show_hidden = false, -- Do not show hidden files by default
                is_hidden_file = function(name, _)
                    return vim.startswith(name, ".") -- Define hidden files as those starting with "."
                end,
                is_always_hidden = function(_, _)
                    return false -- No files are always hidden
                end,
            },
            float = {
                padding = 2,
                max_width = 120,
                max_height = 40,
                border = "rounded",
                win_options = {
                    winblend = 10,
                },
            },
            preview = {
                max_width = { 120, 0.9 },
                min_width = { 80, 0.4 },
                max_height = { 60, 0.4 },
                min_height = { 12, 0.1 },
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
            },
            progress = {
                max_width = 0.9,
                min_width = { 40, 0.4 },
                width = nil,
                max_height = { 10, 0.9 },
                min_height = { 5, 0.1 },
                height = nil,
                border = "rounded",
                minimized_border = "none",
                win_options = {
                    winblend = 0,
                },
            },
        },
        config = function(_, opts)
            require("oil").setup(opts)
        end,
    },
}
