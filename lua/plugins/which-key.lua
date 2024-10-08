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
                { "<leader>E", group = "File explorer" },
                { "<leader>D", group = "Debug" },
                { "<leader>q", group = "Messages" },
                { "<leader>r", group = "Refactor" },
                { "<leader>o", group = "Options" },
                { "<leader>x", group = "Trouble" },
            },
        },
    },
}
