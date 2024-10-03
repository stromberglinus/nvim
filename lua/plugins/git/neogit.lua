return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required for Neogit
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional - Telescope integration
      -- Uncomment the next line if you prefer fzf-lua over telescope
      -- "ibhagwan/fzf-lua",              -- optional - FZF integration
    },
    config = function()
      local neogit = require("neogit")

      neogit.setup({
        integrations = {
          diffview = true, -- integrates with diffview.nvim
        },
      })

      -- Keymaps for Neogit
      vim.api.nvim_set_keymap('n', '<leader>gg', '<cmd>Neogit<cr>', { noremap = true, silent = true, desc = "Open Neogit status" })
      vim.api.nvim_set_keymap('n', '<leader>gc', '<cmd>Neogit commit<cr>', { noremap = true, silent = true, desc = "Open Neogit commit" })
      vim.api.nvim_set_keymap('n', '<leader>gp', '<cmd>Neogit pull<cr>', { noremap = true, silent = true, desc = "Pull changes with Neogit" })
      vim.api.nvim_set_keymap('n', '<leader>gP', '<cmd>Neogit push<cr>', { noremap = true, silent = true, desc = "Push changes with Neogit" })
      vim.api.nvim_set_keymap('n', '<leader>gl', '<cmd>Neogit log<cr>', { noremap = true, silent = true, desc = "View git log with Neogit" })
    end
  }
}
