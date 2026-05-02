local uname = vim.uv.os_uname()

_G.OS = uname.sysname
_G.IS_MAC = OS == "Darwin"
_G.IS_LINUX = OS == "Linux"
_G.IS_WINDOWS = OS:find("Windows") and true or false
_G.IS_WSL = IS_LINUX and uname.release:find("Microsoft") and true or false

-- [[ Global options used by hydra ]]
OPTIONS = require("options")
require("options.filehandler").load()

-- [[ Setting ]]
require("settings")

-- [[ Basic Keymaps ]]
require("keymaps")

require("core.pack")

vim.cmd("colorscheme catppuccin")
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
