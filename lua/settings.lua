-- [[ Setting options ]]
-- See `:help vim.opt`
--Global
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true
vim.g.enable_copilot = true

vim.opt.number = false
vim.opt.relativenumber = false
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
vim.opt.list = false

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
vim.o.spell = true

vim.cmd([[
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType gitcommit setlocal colorcolumn=+1

    autocmd FileType minifiles setlocal conceallevel=2

    autocmd FileType c setlocal textwidth=80
    autocmd FileType c setlocal colorcolumn=+1

    autocmd FileType cpp setlocal textwidth=80
    autocmd FileType cpp setlocal colorcolumn=+1

    autocmd FileType python setlocal textwidth=120
    autocmd FileType python setlocal colorcolumn=+1

    autocmd FileType lua setlocal textwidth=100
    autocmd FileType lua setlocal colorcolumn=+1

    autocmd FileType qf setlocal nonu
    autocmd FileType qf setlocal nornu

    autocmd FileType markdown setlocal conceallevel=2
    autocmd FileType markdown setlocal textwidth=120
    autocmd FileType markdown setlocal colorcolumn=+1

    autocmd User TelescopePreviewerLoaded setlocal wrap
    autocmd User TelescopePreviewerLoaded setlocal wrap

    autocmd CmdwinEnter * nnoremap <CR> <CR>

    autocmd BufReadPost quickfix nnoremap <CR> <CR>

    autocmd TermOpen * setlocal nospell
    autocmd TermOpen * setlocal nornu
    autocmd TermOpen * setlocal nonu
]])
