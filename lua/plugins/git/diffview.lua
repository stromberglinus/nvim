local icons = require("utils.icons")
return {
    {
        "sindrets/diffview.nvim",
        cond = not vim.g.vscode,
        keys = {
            {
                "<leader>go",
                "<cmd>DiffviewOpen origin/HEAD...HEAD --imply-local<cr>",
                desc = "Diff to origin",
            },
            {
                "<leader>gF",
                "<cmd>DiffviewFileHistory %<cr>",
                desc = "View buffer history",
            },
            {
                "<leader>gd",
                "<cmd>DiffviewOpen<cr>",
                desc = "Open diffview",
            },
            {
                "<leader>gD",
                "<cmd>DiffviewClose<cr>",
                desc = "Close diffview",
            },
        },
        event = "BufEnter",
        opts = {
            diff_binaries = false,
            enhanced_diff_hl = true,
            use_icons = true,
            keymaps = {
                file_panel = {
                    {
                        "n",
                        "cc",
                        "<Cmd>Git commit <bar> wincmd J<CR>",
                        { desc = "Commit staged changes" },
                    },
                    {
                        "n",
                        "ca",
                        "<Cmd>Git commit --amend <bar> wincmd J<CR>",
                        { desc = "Amend the last commit" },
                    },
                    {
                        "n",
                        "c<space>",
                        ":Git commit ",
                        { desc = 'Populate command line with ":Git commit "' },
                    },
                },
            },
            icons = {
                folder_closed = icons.folder_closed,
                folder_open = icons.folder_open,
            },
            signs = {
                fold_closed = icons.fold.closed,
                fold_open = icons.fold.open,
                done = icons.progress.done,
            },
            view = {
                merge_tool = {
                    layout = "diff3_mixed",
                },
            },
            hooks = {
                view_opened = function(
                    _ --[[view]]
                )
                    -- ColorizerDetachFromBuffer removed
                end,
                view_closed = function(
                    _ --[[view]]
                )
                    -- ColorizerReloadAllBuffers removed
                end,
                view_enter = function(
                    _ --[[view]]
                )
                    -- ColorizerDetachFromBuffer removed
                end,
                view_leave = function(
                    _ --[[view]]
                )
                    -- ColorizerReloadAllBuffers removed
                end,
            },
        },
    },
}
