local ok, vault_paths = pcall(require, "localPaths/vault_paths")

if not ok then
  OPTIONS.local_vault_path.personal = vim.fn.expand("~/workspace/ObsidianVaults/personal")
  OPTIONS.local_vault_path.work = vim.fn.expand("~/workspace/ObsidianVaults/work")
  OPTIONS.local_vault_path.value = false
else
  OPTIONS.local_vault_path.value = true
  OPTIONS.local_vault_path.personal = vault_paths.personal
  OPTIONS.local_vault_path.work = vault_paths.work
end

vim.fn.mkdir(OPTIONS.local_vault_path.personal, "p")
vim.fn.mkdir(OPTIONS.local_vault_path.work, "p")

local function obsidian_opts(dir)
  return {
    dir = dir or OPTIONS.local_vault_path.work,

    workspaces = {
      {
        name = "work",
        path = OPTIONS.local_vault_path.work,
      },
      {
        name = "personal",
        path = OPTIONS.local_vault_path.personal,
      },
    },

    picker = {
      name = "fzf-lua",
    },

    templates = {
      folder = "Extras/Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      substitutions = {},
    },

    follow_url_func = function(url)
      if _G.IS_WINDOWS then
        vim.cmd(':silent exec "!start ' .. url .. '"')
      else
        vim.fn.jobstart({ "xdg-open", url })
      end
    end,
  }
end

require("obsidian").setup(obsidian_opts(OPTIONS.local_vault_path.work))

vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", {
  desc = "Obsidian new note",
})

vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianNewFromTemplate<cr>", {
  desc = "Obsidian new from template",
})

vim.keymap.set("n", "<leader>oO", "<cmd>ObsidianOpen<cr>", {
  desc = "Obsidian open",
})

vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", {
  desc = "Obsidian search",
})

vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", {
  desc = "Obsidian backlinks",
})

vim.keymap.set("n", "<leader>oS", function()
  local selected = vim.fn.input("Select vault (personal/work): ", "personal")
  local dir = selected == "work" and OPTIONS.local_vault_path.work or OPTIONS.local_vault_path.personal

  require("obsidian").setup(obsidian_opts(dir))

  vim.notify("Obsidian vault set to: " .. selected)
end, {
  desc = "Select vault path",
})
