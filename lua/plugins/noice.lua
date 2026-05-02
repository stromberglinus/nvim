if vim.g.vscode then
  return
end

local icons = require("utils.icons").diagnostics

require("notify").setup({
  icons = {
    ERROR = icons.Error,
    WARN = icons.Warn,
    INFO = icons.Info,
  },
  render = "wrapped-compact",
  timeout = 3000,
})

vim.notify = require("notify")

require("noice").setup({
  presets = {
    bottom_search = false,
    command_palette = false,
    long_message_to_split = true,
    inc_rename = true,
    lsp_doc_border = true,
  },

  popupmenu = {
    enabled = true,
    backend = "nui",
  },

  override = {
    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    ["vim.lsp.util.stylize_markdown"] = true,
    ["cmp.entry.get_documentation"] = true,
  },

  routes = {
    {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
        },
      },
      view = "mini",
    },
    {
      filter = {
        event = "msg_show",
        kind = "",
        find = "written",
      },
      opts = {
        skip = true,
      },
    },
  },

  cmdline = {
    format = {
      git = {
        pattern = {
          "^:%s*Gi?t?!?%s+",
        },
        icon = "",
        lang = "git",
      },
    },
  },

  views = {
    cmdline_popup = {
      border = {
        style = "none",
        padding = { 1, 1 },
      },
      filter_options = {},
      win_options = {
        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
      },
    },
  },
})
