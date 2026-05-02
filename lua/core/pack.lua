local packages = {
    {
        src = "https://github.com/catppuccin/nvim",
        name = "catppuccin",
        version = "main",
    },
    {
        src = "https://github.com/lewis6991/gitsigns.nvim",
        name = "gitsigns.nvim",
        version = "main",
    },
    {
        src = "https://github.com/folke/which-key.nvim",
        name = "which-key.nvim",
        version = "main",
    },
    {
        src = "https://github.com/folke/todo-comments.nvim",
        name = "todo-comments.nvim",
        version = "main",
    },
    {
      src = "https://github.com/nvim-lualine/lualine.nvim",
      name = "lualine.nvim",
      version = "master",
    },
    {
        src = "https://github.com/nvim-mini/mini.nvim",
        name = "mini.nvim",
        version = "main",
    },
    {
        src = "https://github.com/folke/flash.nvim",
        name = "flash.nvim",
        version = "main",
    },
    {
      src = "https://github.com/folke/snacks.nvim",
      name = "snacks.nvim",
      version = "main",
    },
    {
      src = "https://github.com/akinsho/toggleterm.nvim",
      name = "toggleterm.nvim",
      version = "main",
    },
    {
      src = "https://github.com/MaxNiia/nvim-unception",
      name = "nvim-unception",
      version = "main",
    },
    {
      src = "https://github.com/nvim-treesitter/nvim-treesitter",
      name = "nvim-treesitter",
      version = "main",
    },
    {
      src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
      name = "nvim-treesitter-textobjects",
      version = "main",
    },
    {
      src = "https://github.com/nvim-treesitter/nvim-treesitter-context",
      name = "nvim-treesitter-context",
      version = "master",
    },
    {
      src = "https://github.com/MagicDuck/grug-far.nvim",
      name = "grug-far.nvim",
      version = "main",
    },
    {
      src = "https://github.com/stevearc/conform.nvim",
      name = "conform.nvim",
      version = "master",
    },
    {
      src = "https://github.com/mfussenegger/nvim-dap",
      name = "nvim-dap",
      version = "master",
    },
    {
      src = "https://github.com/rcarriga/nvim-dap-ui",
      name = "nvim-dap-ui",
      version = "master",
    },
    {
      src = "https://github.com/theHamsta/nvim-dap-virtual-text",
      name = "nvim-dap-virtual-text",
      version = "master",
    },
    {
      src = "https://github.com/nvim-neotest/nvim-nio",
      name = "nvim-nio",
      version = "master",
    },
    {
      src = "https://github.com/hrsh7th/nvim-cmp",
      name = "nvim-cmp",
      version = "main",
    },
    {
      src = "https://github.com/hrsh7th/cmp-nvim-lsp",
      name = "cmp-nvim-lsp",
      version = "main",
    },
    {
      src = "https://github.com/hrsh7th/cmp-buffer",
      name = "cmp-buffer",
      version = "main",
    },
    {
      src = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol",
      name = "cmp-nvim-lsp-document-symbol",
      version = "main",
    },
    {
      src = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
      name = "cmp-nvim-lsp-signature-help",
      version = "main",
    },
    {
      src = "https://github.com/hrsh7th/cmp-path",
      name = "cmp-path",
      version = "main",
    },
    {
      src = "https://github.com/nvim-lua/plenary.nvim",
      name = "plenary.nvim",
      version = "master",
    },
    {
      src = "https://github.com/petertriho/cmp-git",
      name = "cmp-git",
      version = "main",
    },
    {
      src = "https://github.com/hrsh7th/cmp-cmdline",
      name = "cmp-cmdline",
      version = "main",
    },
    {
      src = "https://github.com/rafamadriz/friendly-snippets",
      name = "friendly-snippets",
      version = "main",
    },
    {
      src = "https://github.com/onsails/lspkind.nvim",
      name = "lspkind.nvim",
      version = "master",
    },
    {
      src = "https://github.com/saadparwaiz1/cmp_luasnip",
      name = "cmp_luasnip",
      version = "master",
    },
    {
      src = "https://github.com/L3MON4D3/LuaSnip",
      name = "LuaSnip",
      version = "master",
    },
    {
      src = "https://github.com/rcarriga/nvim-notify",
      name = "nvim-notify",
      version = "master",
    },
    {
      src = "https://github.com/MunifTanjim/nui.nvim",
      name = "nui.nvim",
      version = "main",
    },
    {
      src = "https://github.com/folke/noice.nvim",
      name = "noice.nvim",
      version = "main",
    },
    {
      src = "https://github.com/windwp/nvim-autopairs",
      name = "nvim-autopairs",
      version = "master",
    },
    {
      src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
      name = "render-markdown.nvim",
      version = "main",
    },
    {
      src = "https://github.com/ibhagwan/fzf-lua",
      name = "fzf-lua",
      version = "main",
    },
    {
      src = "https://github.com/epwalsh/obsidian.nvim",
      name = "obsidian.nvim",
      version = "main",
    },
    {
      src = "https://github.com/zbirenbaum/copilot.lua",
      name = "copilot.lua",
      version = "master",
    },
    {
      src = "https://github.com/CopilotC-Nvim/CopilotChat.nvim",
      name = "CopilotChat.nvim",
      version = "main",
    },
    {
      src = "https://github.com/folke/lazydev.nvim",
      name = "lazydev.nvim",
      version = "main",
    },
    {
      src = "https://github.com/neovim/nvim-lspconfig",
      name = "nvim-lspconfig",
      version = "master",
    },
    {
      src = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      name = "lsp_lines.nvim",
      version = "main",
    },
    {
      src = "https://github.com/p00f/clangd_extensions.nvim",
      name = "clangd_extensions.nvim",
      version = "main",
    },
    {
      src = "https://github.com/mortepau/codicons.nvim",
      name = "codicons.nvim",
      version = "master",
    },
}

vim.api.nvim_create_autocmd("PackChanged", {
  pattern = "nvim-treesitter",
  group = vim.api.nvim_create_augroup("treesitter_update", { clear = true }),
  callback = function(e)
    if e.data.kind == "update" or e.data.kind == "install" then
      vim.cmd.packadd({ args = { e.data.spec.name }, bang = false })
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add(packages, {
    load = true,
    confirm = false,
})

require("plugins.catppuccin")

require("plugins.lualine")
require("plugins.which-key")
require("plugins.mini")
require("plugins.snacks")

require("plugins.treesitter")
require("plugins.cmp")
require("plugins.autopairs")
require("plugins.lsp.init")
require("plugins.noice")

require("plugins.flash")
require("plugins.gitsigns")
require("plugins.todo-comments")
require("plugins.toggleterm")
require("plugins.grug")
require("plugins.conform")
require("plugins.dap")
-- require("plugins.cmake"),

require("plugins.obsidian")
require("plugins.render-markdown")

require("plugins.copilot")
