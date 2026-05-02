-- mini.icons
package.preload["nvim-web-devicons"] = function()
    package.loaded["nvim-web-devicons"] = {}
    require("mini.icons").mock_nvim_web_devicons()
    return package.loaded["nvim-web-devicons"]
end

require("mini.icons").setup()

-- mini.ai
require("mini.ai").setup({
    n_lines = 500,
})

-- mini.surround
require("mini.surround").setup({
    custom_surroundings = {
        ["("] = {
            input = { "%b()", "^.().*().$" },
            output = { left = "(", right = ")" },
        },
        ["["] = {
            input = { "%b[]", "^.().*().$" },
            output = { left = "[", right = "]" },
        },
        ["{"] = {
            input = { "%b{}", "^.().*().$" },
            output = { left = "{", right = "}" },
        },
        ["<"] = {
            input = { "%b<>", "^.().*().$" },
            output = { left = "<", right = ">" },
        },
    },
})

if not vim.g.vscode then
    -- mini.files
    require("mini.files").setup({
        options = {
            -- NOTE: your Lazy config had "permament_delete".
            -- mini.files uses "permanent_delete".
            permanent_delete = true,
            use_as_default_explorer = true,
        },
        windows = {
            preview = true,
            width_preview = 80,
            width_focus = 50,
            width_nofocus = 20,
        },
    })

    vim.keymap.set("n", "<leader>e", function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    end, { desc = "Explorer current file" })

    vim.keymap.set("n", "<leader>EC", function()
        MiniFiles.open(nil, false)
    end, { desc = "CWD" })

    vim.keymap.set("n", "<leader>EB", function()
        MiniFiles.open(MiniFiles.get_latest_path())
    end, { desc = "Latest path" })

    vim.keymap.set("n", "<leader>EH", function()
        MiniFiles.open(vim.fn.expand("$HOME"))
    end, { desc = "Home" })
end
