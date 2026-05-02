if vim.g.vscode then
  return
end

local ensure_installed = {
  "bash",
  "c",
  "cpp",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "regex",
  "rust",
  "vim",
  "vimdoc",
  "json",
  "yaml",
}

local filetypes = {
  "bash",
  "c",
  "cpp",
  "lua",
  "markdown",
  "python",
  "rust",
  "vim",
  "vimdoc",
  "json",
  "yaml",
  "sh",
}

require("nvim-treesitter").setup({})

require("nvim-treesitter").install(ensure_installed)

require("treesitter-context").setup({
  max_lines = 3,
  multiline_threshold = 1,
  min_window_height = 20,
})

vim.keymap.set("n", "[c", function()
  vim.schedule(function()
    require("treesitter-context").go_to_context()
  end)
  return "<Ignore>"
end, { desc = "Jump to upper context", expr = true })

local move = require("nvim-treesitter-textobjects.move")
local swap = require("nvim-treesitter-textobjects.swap")

local function goto_map(lhs, fn, query, desc)
  vim.keymap.set("n", lhs, function()
    fn(query)
  end, { desc = desc })
end

goto_map("]m", move.goto_next_start, "@function.outer", "Next function")
goto_map("]C", move.goto_next_start, "@class.outer", "Next class")
goto_map("]M", move.goto_next_end, "@function.outer", "Next function end")
goto_map("[m", move.goto_previous_start, "@function.outer", "Prev function")
goto_map("[C", move.goto_previous_start, "@class.outer", "Prev class")
goto_map("[M", move.goto_previous_end, "@function.outer", "Prev function end")

vim.keymap.set("n", "<leader>ap", function()
  swap.swap_next("@parameter.inner")
end, { desc = "Swap next parameter" })

vim.keymap.set("n", "<leader>aP", function()
  swap.swap_previous("@parameter.inner")
end, { desc = "Swap prev parameter" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = filetypes,
  callback = function()
    pcall(vim.treesitter.start)

    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
