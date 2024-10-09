-- Try to load the vault_paths.lua file
local ok, vault_paths = pcall(require, "localPaths/vault_paths")

-- If loading failed, set default paths
if not ok then
    vault_paths = {
        personal = vim.fn.expand("~/workspace/ObsidianVaults/personal"),
        work = vim.fn.expand("~/workspace/ObsidianVaults/work"),
    }
    OPTIONS.local_vault_path.value = false
else
    OPTIONS.local_vault_path.value = true
end

-- Create commands to create new notes in personal and work vaults
vim.api.nvim_create_user_command("ObsidianNewPersonal", function()
    require("obsidian").setup({ dir = vault_paths.personal }) -- Switch to personal vault
    vim.cmd("ObsidianNew")
end, { desc = "Create a new note in the personal vault" })

vim.api.nvim_create_user_command("ObsidianNewWork", function()
    require("obsidian").setup({ dir = vault_paths.work }) -- Switch to work vault
    vim.cmd("ObsidianNew")
end, { desc = "Create a new note in the work vault" })

-- Keybindings to create notes in personal or work vaults
vim.api.nvim_set_keymap(
    "n",
    "<leader>op",
    ":ObsidianNewPersonal<CR>",
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>ow",
    ":ObsidianNewWork<CR>",
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

return {
    "epwalsh/obsidian.nvim",
    version = "*", -- Use the latest stable release
    lazy = true,
    ft = "markdown",
    cmd = { "ObsidianOpen", "ObsidianNew", "ObsidianSearch", "ObsidianBacklinks" }, -- Load on these commands
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
                name = "personal",
                path = vault_paths.personal, -- Set personal vault path
            },
            {
                name = "work",
                path = vault_paths.work, -- Set work vault path
            },
        },
    },
}
