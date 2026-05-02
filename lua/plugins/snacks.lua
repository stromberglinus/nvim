---@diagnostic disable: undefined-global

local function week_ascii_text()
  -- stylua ignore start
  return {
    ["Monday"] = [[
███╗   ███╗ ██████╗ ███╗   ██╗██████╗  █████╗ ██╗   ██╗
████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝
██╔████╔██║██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ 
██║╚██╔╝██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  
██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   
╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ]],
    ["Tuesday"] = [[
████████╗██╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗
╚══██╔══╝██║   ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝
   ██║   ██║   ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ 
   ██║   ██║   ██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  
   ██║   ╚██████╔╝███████╗███████║██████╔╝██║  ██║   ██║   
   ╚═╝    ╚═════╝ ╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ]],
    ["Wednesday"] = [[
██╗    ██╗███████╗██████╗ ███╗   ██╗███████╗███████╗██████╗  █████╗ ██╗   ██╗
██║    ██║██╔════╝██╔══██╗████╗  ██║██╔════╝██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝
██║ █╗ ██║█████╗  ██║  ██║██╔██╗ ██║█████╗  ███████╗██║  ██║███████║ ╚████╔╝ 
██║███╗██║██╔══╝  ██║  ██║██║╚██╗██║██╔══╝  ╚════██║██║  ██║██╔══██║  ╚██╔╝  
╚███╔███╔╝███████╗██████╔╝██║ ╚████║███████╗███████║██████╔╝██║  ██║   ██║   
 ╚══╝╚══╝ ╚══════╝╚═════╝ ╚═╝  ╚═══╝╚══════╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ]],
    ["Thursday"] = [[
████████╗██╗  ██╗██╗   ██╗██████╗ ███████╗██████╗  █████╗ ██╗   ██╗
╚══██╔══╝██║  ██║██║   ██║██╔══██╗██╔════╝██╔══██╗██╔══██╗╚██╗ ██╔╝
   ██║   ███████║██║   ██║██████╔╝███████╗██║  ██║███████║ ╚████╔╝ 
   ██║   ██╔══██║██║   ██║██╔══██╗╚════██║██║  ██║██╔══██║  ╚██╔╝  
   ██║   ██║  ██║╚██████╔╝██║  ██║███████║██████╔╝██║  ██║   ██║   
   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ]],
    ["Friday"] = [[
███████╗██████╗ ██╗██████╗  █████╗ ██╗   ██╗
██╔════╝██╔══██╗██║██╔══██╗██╔══██╗╚██╗ ██╔╝
█████╗  ██████╔╝██║██║  ██║███████║ ╚████╔╝ 
██╔══╝  ██╔══██╗██║██║  ██║██╔══██║  ╚██╔╝  
██║     ██║  ██║██║██████╔╝██║  ██║   ██║   
╚═╝     ╚═╝  ╚═╝╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ]],
    ["Saturday"] = [[
███████╗ █████╗ ████████╗██╗   ██╗██████╗ ██████╗  █████╗ ██╗   ██╗
██╔════╝██╔══██╗╚══██╔══╝██║   ██║██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝
███████╗███████║   ██║   ██║   ██║██████╔╝██║  ██║███████║ ╚████╔╝ 
╚════██║██╔══██║   ██║   ██║   ██║██╔══██╗██║  ██║██╔══██║  ╚██╔╝  
███████║██║  ██║   ██║   ╚██████╔╝██║  ██║██████╔╝██║  ██║   ██║   
╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ]],
    ["Sunday"] = [[
███████╗██╗   ██╗███╗   ██╗██████╗  █████╗ ██╗   ██╗
██╔════╝██║   ██║████╗  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝
███████╗██║   ██║██╔██╗ ██║██║  ██║███████║ ╚████╔╝ 
╚════██║██║   ██║██║╚██╗██║██║  ██║██╔══██║  ╚██╔╝  
███████║╚██████╔╝██║ ╚████║██████╔╝██║  ██║   ██║   
╚══════╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   ]],
  }
  -- stylua ignore end
end

local function week_header()
  local week = week_ascii_text()
  local days = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
  local day = days[os.date("*t").wday]
  return week[day]
end

require("snacks").setup({
  image = {
    enabled = true,
    force = true,
  },
  gh = {},
  lazygit = {
    enabled = true,
  },
  explorer = {
    enabled = false,
  },
  picker = {
    enabled = true,
    previewers = {
      diff = {
        cmd = { "delta" },
      },
    },
    formatters = {
      file = {
        filename_first = true,
        truncate = 40,
      },
    },
  },
  bigfile = { enabled = true },
  scroll = {
    animate = {
      duration = {
        step = 10,
        total = 50,
      },
      easing = "linear",
    },
  },
  input = { enabled = true },
  quickfile = { enabled = true },
  bufdelete = { enabled = true },
  scope = { enabled = true },
  words = { enabled = true },
  dashboard = {
    enabled = true,
    preset = {
      keys = {
        { icon = " ", key = "f", desc = "Find File", action = "<leader>ff" },
        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
        { icon = " ", key = "s", desc = "Find Text", action = "<leader>sg" },
        { icon = " ", key = "p", desc = "Pick Project", action = "<leader>fp" },
        { icon = " ", key = "r", desc = "Recent Files", action = "<leader>fr" },
        { icon = " ", key = "g", desc = "Lazygit", action = "<leader>gg" },
        { icon = " ", key = "G", desc = "Lazygit config", action = "<leader>gG" },
        { icon = " ", key = "c", desc = "Config", action = "<leader>fc" },
        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
      },
    },
    sections = {
      { section = "header" },
      { section = "keys", gap = 1, padding = 2 },
      { section = "startup", padding = 1 },
      {
        pane = 2,
        align = "center",
        title = week_header(),
        padding = 2,
      },
      {
        pane = 2,
        icon = " ",
        title = "Projects",
        section = "projects",
        indent = 2,
        padding = 1,
      },
      {
        pane = 2,
        icon = " ",
        title = "Git Status",
        section = "terminal",
        enabled = function()
          local cwd = vim.uv.cwd()
          if not cwd then
            return false
          end
          local ok = vim.uv.fs_stat(cwd .. "/.git")
          return ok ~= nil
        end,
        cmd = "git status --short --branch --renames",
        height = 5,
        padding = 1,
        ttl = 5 * 60,
        indent = 3,
      },
      {
        pane = 2,
        align = "center",
        text = {
          { " ", hl = "special" },
          { os.date("%Y-%m-%d"), hl = "footer" },
          { "   󰕶 ", hl = "special" },
          { os.date("%W"), hl = "footer" },
          { "   󰥔 ", hl = "special" },
          { os.date("%H:%M:%S"), hl = "footer" },
        },
      },
    },
  },
  notifier = {
    enabled = true,
    timeout = 3000,
    max_notifications = 4,
  },
  terminal = {
    enabled = true,
    keys = {
      q = "hide",
      gf = function(self)
        local line = vim.api.nvim_get_current_line()
        local file, lnum, col_num

        file, lnum, col_num = line:match("([^%s:]+):(%d+):(%d+):")
        if not file then
          file, lnum = line:match("([^%s:]+):(%d+):")
        end
        if not file then
          file, lnum = line:match("([^%s%(]+)%((%d+)%)")
        end
        if not file then
          file = vim.fn.expand("<cfile>")
        end

        local found = file ~= "" and vim.fn.findfile(file, "**") or ""
        if found == "" then
          Snacks.notify.warn("No file under cursor")
          return
        end

        self:hide()
        local row = lnum and tonumber(lnum)
        local col = col_num and math.max(0, tonumber(col_num) - 1) or 0
        vim.schedule(function()
          vim.cmd("e " .. vim.fn.fnameescape(found))
          if row then
            vim.api.nvim_win_set_cursor(0, { row, col })
          end
        end)
      end,
    },
  },
  zen = {
    toggles = {
      dim = false,
      git_signs = true,
      diagnostics = true,
      inlay_hints = true,
    },
    show = {
      statusline = false,
      tabline = false,
    },
    zoom = {
      toggles = {},
      show = {
        statusline = true,
        tabline = true,
      },
      win = {
        backdrop = false,
        width = 0,
      },
    },
  },
  indent = {
    animate = {
      enabled = vim.fn.has("nvim-0.10") == 1,
      easing = "linear",
      duration = {
        step = 20,
        total = 100,
      },
    },
    scope = {
      enabled = true,
      underline = false,
    },
    chunk = {
      enabled = true,
      only_current = true,
      hl = "SnacksIndentChunk",
      char = {
        corner_top = "┌",
        corner_bottom = "└",
        horizontal = "─",
        vertical = "│",
        arrow = ">",
      },
    },
    filter = function(buf)
      return vim.g.snacks_indent ~= false
        and vim.b[buf].snacks_indent ~= false
        and vim.bo[buf].buftype == ""
    end,
  },
  statuscolumn = {
    enabled = true,
    left = { "mark", "sign" },
    right = { "fold", "git" },
    folds = {
      open = true,
      git_hl = true,
    },
    git = {
      patterns = { "GitSign", "MiniDiffSign" },
    },
    refresh = 50,
  },
  styles = {
    dashboard = {
      wo = {
        colorcolumn = "",
      },
    },
    notification = {
      wo = {
        wrap = true,
      },
    },
  },
})

local Snacks = require("snacks")
local key = vim.keymap.set

key("n", "<leader>/", function()
  Snacks.picker.grep()
end, { desc = "Grep" })

key("n", "<leader>:", function()
  Snacks.picker.command_history()
end, { desc = "Command History" })

key("n", "<leader>,", function()
  Snacks.picker.buffers()
end, { desc = "Buffers" })

key("n", "<leader><space>", function()
  Snacks.picker.smart()
end, { desc = "Smart Find Files" })

key("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Find Files" })

key("n", "<leader>fp", function()
  Snacks.picker.projects()
end, { desc = "Projects" })

key("n", "<leader>fc", function()
  Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })

key("n", "<leader>fr", function()
  Snacks.picker.recent()
end, { desc = "Recent" })

key("n", "<leader>gg", function()
  Snacks.lazygit()
end, { desc = "Lazygit" })

key("n", "<leader>gG", function()
  Snacks.terminal("lazygit --git-dir=$HOME/.cfg --work-tree=$HOME")
end, { desc = "Lazygit dotfiles" })

key("n", "<leader>un", function()
  Snacks.notifier.hide()
end, { desc = "Dismiss All Notifications" })

key("n", "<leader>q", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

key("n", "<leader>tf", function()
  Snacks.terminal(nil, { win = { position = "float" } })
end, { desc = "Toggle Terminal (float)" })

key("n", "<c-_>", function()
  Snacks.terminal()
end, { desc = "which_key_ignore" })
