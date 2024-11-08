return {
    {
        "stevearc/dressing.nvim",
        lazy = "VeryLazy",
        opts = {
            input = {
                insert_only = false,
            },
        },
        config = function(_, opts)
            opts = vim.tbl_extend("force", opts, {
                select = {
                    backend = { "fzf_lua", "fzf", "telescope" },
                    telescope = {
                        initial_mode = "normal",
                        layout_strategy = "cursor",
                    },
                },
            })
            require("dressing").setup(opts)
        end,
        init = function()
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },
}
