-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  Press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins run
--    :Lazy update
--

require("lazy").setup({
    "tpope/vim-sleuth",

    require("plugins/catppuccin"),

    require("plugins/gitsigns"),

    require("plugins/which-key"),

    require("plugins/telescope/telescope"),

    require("plugins/noice/noice"),

    require("plugins/lspconfig"),

    require("plugins/conform"),

    require("plugins/cmp"),

    require("plugins/todo-comments"),

    require("plugins/mini"),

    require("plugins/treesitter"),

    require("plugins/oil"),

    require("plugins/flash"),

    require("plugins/autopairs"),

    require("plugins/smartsplit"),

    require("plugins/trouble"),

    require("plugins/lualine"),

    -- TODO: Go through theses plugins
    -- 3 Fix inlay hints
    -- 5 Add Obsidian plugin

    require("plugins/alpha"),

    require("plugins/indent_blankline"),

    require("plugins/zen_mode"),
    -- require 'kickstart.plugins.debug',
}, {
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})

-- vim: ts=2 sts=2 sw=2 et
