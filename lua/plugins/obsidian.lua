-- Try to load the vault_paths.lua file
local ok, vault_paths = pcall(require, "localPaths/vault_paths")

-- If loading failed, set default paths
if not ok then
    vault_paths = {
        personal = "~/workspace/ObsidianVaults/personal",
        work = "~/workspace/ObsidianVaults/work",
    }
    OPTIONS.local_vault_path.value = false
else
    OPTIONS.local_vault_path.value = true
end

return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- Optional dependencies 👇
        "hrsh7th/nvim-cmp",
        "ibhagwan/fzf-lua",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = vault_paths.personal,
            },
            {
                name = "work",
                path = vault_paths.work,
            },
        },
    },
}
