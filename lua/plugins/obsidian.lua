-- Try to load the vault_paths.lua file
local ok, vault_paths = pcall(require, "localPaths/vault_paths")

-- If loading failed, set default paths
if not ok then
    OPTIONS.local_vault_path.personal = vim.fn.expand("~/workspace/ObsidianVaults/personal")
    OPTIONS.local_vault_path.work = vim.fn.expand("~/workspace/ObsidianVaults/work")
    OPTIONS.local_vault_path.value = false
else
    OPTIONS.local_vault_path.value = true
    OPTIONS.local_vault_path.personal = vault_paths.personal
    OPTIONS.local_vault_path.work = vault_paths.work
end

vim.api.nvim_set_keymap("n", "<leader>on", ":ObsidianNew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
    "n",
    "<leader>ot",
    ":ObsidianNewFromTemplate<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "<leader>oO", ":ObsidianOpen<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>os", ":ObsidianSearch<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
    "n",
    "<leader>ob",
    ":ObsidianBacklinks<CR>",
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>oS",
    ":lua require('obsidian').setup({ dir = vim.fn.input('Select vault (personal/work): ', 'personal') == 'work' and '"
        .. OPTIONS.local_vault_path.work
        .. "' or '"
        .. OPTIONS.local_vault_path.personal
        .. "' })<CR>",
    { noremap = true, silent = true, desc = "Select vault path" }
)

return {
    "epwalsh/obsidian.nvim",
    version = "*", -- Use the latest stable release
    lazy = true,
    ft = "markdown",
    cmd = {
        "ObsidianOpen",
        "ObsidianNew",
        "ObsidianSearch",
        "ObsidianBacklinks",
        "ObsidianNewFromTemplate",
    }, -- Load on these commands
    dependencies = {
        -- Required dependency
        "nvim-lua/plenary.nvim",

        -- Optional dependencies
        "hrsh7th/nvim-cmp", -- For completion
        "ibhagwan/fzf-lua", -- For fuzzy search
        "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
    },
    opts = {
        workspaces = {
            {
                name = "work",
                path = OPTIONS.local_vault_path.work, -- Set work vault path
            },
            {
                name = "personal",
                path = OPTIONS.local_vault_path.personal, -- Set personal vault path
            },
        },
        templates = {
            folder = "Extras/Templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
            -- A map for custom variables, the key should be the variable and the value a function
            substitutions = {},
        },
        ---@param url string
        follow_url_func = function(url)
            -- Open the URL in the default web browser.
            if _G.IS_WINDOWS then
                vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
            else
                vim.fn.jobstart({ "xdg-open", url }) -- linux
            end
        end,
    },
    config = function(_, opts)
        -- Set work vault as the default on startup
        opts.dir = OPTIONS.local_vault_path.work -- Set the default starting vault to work
        require("obsidian").setup(opts)
    end,
}
