-- [[ Setting options ]]
-- See `:help vim.opt`

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.ai = true
vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.autowriteall = true
vim.opt.backspace = "indent,eol,start"
vim.opt.belloff = "all"
vim.opt.cmdheight = 0
vim.opt.colorcolumn = "+1"
vim.opt.compatible = false
vim.opt.cul = true
vim.opt.culopt = "both"
vim.opt.expandtab = true
vim.opt.foldcolumn = "auto:1"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.opt.hidden = true
vim.opt.history = 1000
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.mousemodel = "extend"
vim.opt.numberwidth = 2
vim.opt.ruler = false
vim.opt.shiftwidth = 4
vim.opt.showtabline = 0
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 2
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.spelloptions = "camel"
vim.opt.splitkeep = "screen"
vim.opt.swapfile = false
vim.opt.tabpagemax = 50
vim.opt.tabstop = 8
vim.opt.termguicolors = true
vim.opt.textwidth = 80
vim.opt.timeout = true
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 5
vim.opt.wildmenu = true

vim.opt.winblend = 0
vim.opt.pumblend = 0

-- Set fillchars and listchars using custom icons
local icons = require("utils.icons")
vim.opt.fillchars:append({
	diff = icons.misc.slash,
	foldopen = icons.fold.open,
	foldclose = icons.fold.closed,
	foldsep = icons.fold.separator,
})

vim.opt.listchars:append({
    tab = icons.chevron.right .. " ",
    trail = icons.misc.minus,
    extends = icons.chevron.right,
    precedes = icons.chevron.left,
    nbsp = icons.misc.plus,
})

-- Enable spell checking in the current window
vim.wo.spell = true

-- vim: ts=2 sts=2 sw=2 et
