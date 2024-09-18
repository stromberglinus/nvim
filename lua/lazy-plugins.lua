-- [[ Configure and install plugins ]]
require("lazy").setup({
    "tpope/vim-sleuth",

    require("lua.plugins.catppuccin"),

    require("lua.plugins.gitsigns"),

    require("lua.plugins.which-key"),

    require("lua.plugins.fzf"),

    require("lua.plugins.telescope.telescope"),

    require("lua.plugins.noice.noice"),

    require("lua.plugins.lsp.init"),

    require("lua.plugins.lsp_lines"),

    require("lua.plugins.conform"),

    require("lua.plugins.cmp"),

    require("lua.plugins.todo-comments"),

    require("lua.plugins.mini"),

    require("lua.plugins.treesitter"),

    require("lua.plugins.oil"),

    require("lua.plugins.flash"),

    require("lua.plugins.autopairs"),

    require("lua.plugins.smartsplit"),

    require("lua.plugins.trouble"),

    require("lua.plugins.lualine"),

    require("lua.plugins.alpha"),

    require("lua.plugins.indent_blankline"),

    require("lua.plugins.zen_mode"),

    require("lua.plugins.hydra.init"),

    require("lua.plugins.toggleterm"),
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
