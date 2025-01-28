return {
    {
        "stevearc/conform.nvim",
        event = { "VeryLazy" }, -- Load early
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>d",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = { "n", "v" }, -- Normal and visual mode
                desc = "Format",
            },
        },
        opts = {
            notify_on_error = false,
            format_on_save = function(bufnr)
                -- Only format on save if user option is enabled
                if OPTIONS and OPTIONS.format_on_save and OPTIONS.format_on_save.value then
                    return {
                        timeout_ms = 500,
                        lsp_fallback = true,
                    }
                else
                    return false -- Disable format on save
                end
            end,
            formatters_by_ft = {
                ["_"] = { "trim_whitespace" },
                lua = { "stylua" },
                python = { "ruff_format" },
                css = { "stylelint" },
                javascript = {
                    "prettierd",
                    "prettier",
                    "eslint_d",
                    "eslint",
                    stop_after_first = true,
                },
                typescript = {
                    "prettierd",
                    "prettier",
                    "eslint_d",
                    "eslint",
                    stop_after_first = true,
                },
                json = { "fixjson" },
                markdown = { "markdownlint" },
                cpp = { "clang-format" },
            },
        },
        config = function(_, opts)
            require("conform").setup(opts)

            -- Set up keybinding manually
            vim.keymap.set("n", "<leader>d", function()
                require("conform").format({ async = true, lsp_fallback = true })
            end, { desc = "Format" })

            -- Ensure format-on-save still works
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*",
                callback = function(args)
                    local format_opts = opts.format_on_save(args.buf)
                    if format_opts then
                        require("conform").format({
                            bufnr = args.buf,
                            async = false,
                            lsp_fallback = format_opts.lsp_fallback,
                        })
                    end
                end,
            })
        end,
    },
}
