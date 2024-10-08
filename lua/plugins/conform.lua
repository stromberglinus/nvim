return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>d",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "",
                desc = "Format",
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                -- Check if format on save is enabled using OPTIONS
                if not OPTIONS.format_on_save.value then
                    return false
                end

                -- Disable format on save for certain filetypes
                local disable_filetypes = { c = true, cpp = true }
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
            formatters_by_ft = {
                ["_"] = { "trim_whitespace" },
                lua = { "stylua" },
                python = { "ruff_format" },
                css = { "stylelint" },
                javascript = { { "prettierd", "prettier" }, { "eslint_d", "eslint" } },
                javascriptreact = {
                    "stylelint",
                    { "prettierd", "prettier" },
                    { "eslint_d", "eslint" },
                },
                markdown = { "markdownlint" },
                cpp = { "clang-format" },
            },
        },
    },
}
