-- [[ Configure and install plugins ]]
require("lazy").setup({
    "tpope/vim-sleuth",
    require("plugins.catppuccin"),

    require("plugins.git.gitsigns"),

    require("plugins.git.diffview"),

    require("plugins.which-key"),

    require("plugins.telescope.telescope"),

    require("plugins.session"),

    require("plugins.incline"),

    require("plugins.noice"),
    require("plugins.lsp.init"),

    require("plugins.lsp_lines"),

    require("plugins.conform"),

    require("plugins.cmp"),

    require("plugins.todo-comments"),

    require("plugins.mini"),

    require("plugins.treesitter"),

    require("plugins.flash"),

    require("plugins.autopairs"),

    require("plugins.smartsplit"),

    require("plugins.lualine"),

    require("plugins.zen_mode"),

    require("plugins.hydra"),

    require("plugins.toggleterm"),

    require("plugins.grug"),

    require("plugins.dap"),

    require("plugins.obsidian"),

    require("plugins.render-markdown"),

    require("plugins.snacks"),

    require("plugins.cmake"),

    require("plugins.dressing"),
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
