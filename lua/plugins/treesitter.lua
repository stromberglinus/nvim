return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    cond = not vim.g.vscode,

    config = function()
        require("nvim-treesitter").setup({})

        require("nvim-treesitter").install({
            "bash",
            "c",
            "cpp",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "regex",
            "rust",
            "vim",
            "vimdoc",
            "json",
            "yaml",
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end,
}
