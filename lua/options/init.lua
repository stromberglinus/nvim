return {
    local_vault_path = {
        key = "--",
        value = false,
        personal = "",
        work = "",
        description = "local vault paths loaded",
        prompt = nil,
    },
    lsp_lines = {
        value = true,
        key = "ll",
        description = "Toggle LSP lines",
        prompt = nil,
        callback = function()
            require("plugins.lsp.diagnostics")(OPTIONS.lsp_lines.value)
        end,
    },
    session_auto_save = {
        value = false,
        key = "sa",
        description = "Toggle session auto-save",
        prompt = nil,
        callback = function()
            local current_session = require("resession").get_current()
            if current_session and current_session ~= "" then
                require("resession").save(vim.fn.getcwd(), { notify = true })
            end
        end,
    },
    format_on_save = {
        value = true, -- Default to true (enabled)
        key = "fs",
        description = "Toggle format on save",
        prompt = nil,
        callback = function()
            if OPTIONS.format_on_save.value then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
                    pattern = "*",
                    callback = function()
                        require("conform").format({ async = true, lsp_fallback = true })
                    end,
                })
            else
                vim.api.nvim_clear_autocmds({ group = "FormatOnSave" })
            end
        end,
    },
    spell = {
        value = true,
        key = "sp",
        description = "Toggle spell checker",
        prompt = nil,
        callback = function()
            vim.o.spell = OPTIONS.spell.value
        end,
    },
    git_deleted = {
        value = false,
        key = "gd",
        description = "Toggle git deleted highlights",
        prompt = nil,
        callback = function()
            require("gitsigns").toggle_deleted(OPTIONS.git_deleted.value)
        end,
    },
    git_blame_line = {
        value = true,
        key = "gb",
        description = "Toggle git blame line",
        prompt = nil,
        callback = function()
            require("gitsigns").toggle_current_line_blame(OPTIONS.git_blame_line.value)
        end,
    },
}
