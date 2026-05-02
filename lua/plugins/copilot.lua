if not vim.g.enable_copilot then
  return
end

require("copilot").setup({
  server_opts_overrides = {},

  filetypes = {
    ["grug-far"] = false,
    ["grug-far-history"] = false,
    ["grug-far-help"] = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
  },

  panel = {
    enabled = false,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>",
    },
    layout = {
      position = "bottom",
      ratio = 0.4,
    },
  },

  suggestion = {
    enabled = false,
    auto_trigger = false,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      accept_word = false,
      accept_line = false,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
})

require("CopilotChat").setup({
  debug = false,

  suggestion = {
    enabled = false,
  },

  panel = {
    enabled = false,
  },

  mappings = {
    complete = {
      detail = "Use @<Tab> or /<Tab> for options.",
      insert = "<Tab>",
    },
    close = {
      normal = "q",
      insert = "<C-c>",
    },
    reset = {
      normal = "<C-r>",
    },
    submit_prompt = {
      normal = "<CR>",
      insert = "<C-m>",
    },
    accept_diff = {
      normal = "<C-y>",
      insert = "<C-y>",
    },
    yank_diff = {
      normal = "gy",
    },
    show_diff = {
      normal = "gd",
    },
    show_system_prompt = {
      normal = "gp",
    },
    show_user_selection = {
      normal = "gs",
    },
  },
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "copilot-*",
  callback = function()
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false

    vim.keymap.set("n", "<C-p>", function()
      print(require("CopilotChat").response())
    end, {
      buffer = true,
      remap = true,
      desc = "Print last CopilotChat response",
    })
  end,
})

vim.keymap.set("n", "<leader>it", "<cmd>CopilotChatToggle<cr>", {
  desc = "Copilot Chat Toggle",
})

vim.keymap.set({ "n", "v" }, "<leader>iq", function()
  local input = vim.fn.input("Quick Chat: ")

  if input ~= "" then
    require("CopilotChat").ask(input, {
      selection = require("CopilotChat.select").buffer,
    })
  end
end, {
  desc = "Copilot Quick Chat",
})
