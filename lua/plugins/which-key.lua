require("which-key").setup({
    triggers = {
        { "s", mode = "nv" },
        { "<auto>", mode = "nxsotv" },
    },
    plugins = {
        registers = true,
    },
    spec = {
        { "<leader>A", nil, desc = "Azure" },
        { "<leader>Al", nil, desc = "Load" },
        { "<leader>Ao", nil, desc = "Open" },
        { "<leader>As", nil, desc = "Submit" },
        { "<leader>c", nil, desc = "CMake" },
        { "<leader>g", nil, desc = "Git" },
        { "<leader>f", nil, desc = "Find" },
        { "<leader>E", nil, desc = "File explorer" },
        { "<leader>q", nil, desc = "Messages" },
        { "<leader>r", nil, desc = "Refactor" },
        { "<leader>o", nil, desc = "Obsidian" },
        { "<leader>t", nil, desc = "Options" },
        { "<leader>x", nil, desc = "Trouble" },
    },
})
