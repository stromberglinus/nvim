return {
    {
        "MagicDuck/grug-far.nvim",
        version = "1.6.3",
        keys = {
            {
                "<leader>rr",
                function()
                    require("grug-far").open()
                end,
                desc = "Search and replace",
                mode = { "n", "v" },
            },
        },
        config = true,
    },
}
