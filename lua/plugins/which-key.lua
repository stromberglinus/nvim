return {
    { -- Useful plugin to show you pending keybinds.
        "folke/which-key.nvim",
        event = "VimEnter", -- Sets the loading event to 'VimEnter'
        config = function() -- This is the function that runs, AFTER loading
            require("which-key").setup()

            -- Document existing key chains
            require("which-key").add({
                { "<leader>c", group = "Code" },
                -- { "<leader>d", group = "Document" },
                { "<leader>r", group = "Rename" },
                { "<leader>f", group = "Find" },
                { "<leader>q", group = "Diagnostics" },
                { "<leader>t", group = "Toggle" },
                { "<leader>x", group = "Trouble" },
                { "<leader>g", group = "Git hunk", mode = { "n", "v" } },
            })
        end,
    },
}
-- vim: ts=2 sts=2 sw=2 et
