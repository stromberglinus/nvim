return {
    {
        "folke/which-key.nvim",
        event = "VimEnter", -- Sets the loading event to 'VimEnter'
        opts = {
            triggers = {
                { "s", mode = "nv" },
                { "<auto>", mode = "nxsotv" },
            },
            plugins = {
                registers = true,
            },
            spec = {
                { "<leader>c", group = "CMake" },
                { "<leader>g", group = "Git" },
                { "<leader>f", group = "Find" },
                { "<leader>q", group = "Messages" },
                { "<leader>r", group = "Refactor" },
                { "<leader>t", group = "Toggle" },
                { "<leader>x", group = "Trouble" },
            },
        },
    },
}
