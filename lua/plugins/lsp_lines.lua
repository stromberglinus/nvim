return {
    {
        url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<Leader>tT",
                function()
                    local on = not vim.diagnostic.config().virtual_lines
                    vim.diagnostic.config(require("plugins.lsp.diagnostics")(on))
                end,
                mode = "n",
                desc = "Toggle lsp_lines",
            },
        },
        main = "lsp_lines",
        config = true,
    },
}
