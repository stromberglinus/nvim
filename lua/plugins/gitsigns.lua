return {
    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = "eol",
                    delay = 1000,
                    ignore_whitespace = true,
                },
                current_line_blame_formatter = "<author>:<author_time:%Y/%m/%d>-<summary>",
            },
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")
                local wk = require("which-key")

                -- Enable current line blame by default
                gitsigns.toggle_current_line_blame(true)

                wk.add({

                    { "<leader>g", buffer = 1, group = "Git" },
                    {
                        "<leader>gD",
                        gitsigns.diffthis("@"),
                        buffer = 1,
                        desc = "Diff against last commit",
                    },
                    { "<leader>gR", gitsigns.reset_buffer, buffer = bufnr, desc = "Reset buffer" },
                    { "<leader>gS", gitsigns.stage_buffer, buffer = bufnr, desc = "Stage buffer" },
                    { "<leader>gb", gitsigns.blame_line, buffer = bufnr, desc = "Blame line" },
                    {
                        "<leader>gd",
                        gitsigns.diffthis,
                        buffer = bufnr,
                        desc = "Diff against index",
                    },
                    { "<leader>gj", gitsigns.next_hunk, buffer = bufnr, desc = "Next hunk" },
                    { "<leader>gk", gitsigns.prev_hunk, buffer = bufnr, desc = "Previous hunk" },
                    { "<leader>gp", gitsigns.preview_hunk, buffer = bufnr, desc = "Preview hunk" },
                    { "<leader>gr", gitsigns.reset_hunk, buffer = bufnr, desc = "Reset hunk" },
                    { "<leader>gs", gitsigns.stage_hunk, buffer = bufnr, desc = "Stage hunk" },
                    {
                        "<leader>gu",
                        gitsigns.undo_stage_hunk,
                        buffer = bufnr,
                        desc = "Undo stage hunk",
                    },
                    { "<leader>h", buffer = bufnr, group = "Git hunk" },
                    { "<leader>t", buffer = bufnr, group = "Toggle" },
                    {
                        "<leader>tD",
                        gitsigns.toggle_deleted,
                        buffer = bufnr,
                        desc = "Toggle git show deleted",
                    },
                    {
                        "<leader>tb",
                        gitsigns.toggle_current_line_blame,
                        buffer = bufnr,
                        desc = "Toggle git show blame line",
                    },
                    {
                        "<leader>hr",
                        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }),
                        buffer = bufnr,
                        desc = "Reset hunk",
                        mode = "v",
                    },
                    {
                        "<leader>hs",
                        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }),
                        buffer = bufnr,
                        desc = "Stage hunk",
                        mode = "v",
                    },
                })
            end,
        },
    },
}
-- vim: ts=2 sts=2 sw=2 et
