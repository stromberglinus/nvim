local color1_bg = "#b4befe"
local color2_bg = "#89b4fa"
local color3_bg = "#74c7ec"
local color4_bg = "#89dceb"
local color5_bg = "#94e2d5"
local color6_bg = "#cba6f7"

local text_color1 = "#11111b"
local text_color2 = "#11111b"
local text_color3 = "#11111b"
local text_color4 = "#11111b"
local text_color5 = "#11111b"
local text_color6 = "#11111b"

vim.cmd(string.format([[highlight Headline1Bg guifg=%s guibg=%s]], text_color1, color1_bg))
vim.cmd(string.format([[highlight Headline2Bg guifg=%s guibg=%s]], text_color2, color2_bg))
vim.cmd(string.format([[highlight Headline3Bg guifg=%s guibg=%s]], text_color3, color3_bg))
vim.cmd(string.format([[highlight Headline4Bg guifg=%s guibg=%s]], text_color4, color4_bg))
vim.cmd(string.format([[highlight Headline5Bg guifg=%s guibg=%s]], text_color5, color5_bg))
vim.cmd(string.format([[highlight Headline6Bg guifg=%s guibg=%s]], text_color6, color6_bg))

vim.cmd(string.format([[highlight Headline1Fg cterm=bold gui=bold guifg=%s]], text_color1))
vim.cmd(string.format([[highlight Headline2Fg cterm=bold gui=bold guifg=%s]], text_color2))
vim.cmd(string.format([[highlight Headline3Fg cterm=bold gui=bold guifg=%s]], text_color3))
vim.cmd(string.format([[highlight Headline4Fg cterm=bold gui=bold guifg=%s]], text_color4))
vim.cmd(string.format([[highlight Headline5Fg cterm=bold gui=bold guifg=%s]], text_color5))
vim.cmd(string.format([[highlight Headline6Fg cterm=bold gui=bold guifg=%s]], text_color6))

local emphasis_color = "#8caaee"

vim.cmd(string.format([[highlight markdownItalic guifg=%s]], emphasis_color))
vim.cmd(string.format([[highlight markdownBold guifg=%s]], emphasis_color))
vim.cmd(string.format([[highlight markdownBoldItalic guifg=%s]], emphasis_color))

local ok_obsidian, obsidian = pcall(require, "obsidian")
if ok_obsidian then
  local ok_client, client = pcall(obsidian.get_client)
  if ok_client and client and client.opts and client.opts.ui then
    client.opts.ui.enable = false
  end

  local ns = vim.api.nvim_get_namespaces()["ObsidianUI"]
  if ns then
    pcall(vim.api.nvim_buf_clear_namespace, 0, ns, 0, -1)
  end
end

require("render-markdown").setup({
  heading = {
    sign = false,
    icons = { " ", " ", " ", " ", " ", " " },

    bullet = {
      enabled = true,
    },

    checkbox = {
      enabled = true,
      position = "inline",

      unchecked = {
        icon = "   󰄱 ",
        highlight = "RenderMarkdownUnchecked",
        scope_highlight = nil,
      },

      checked = {
        icon = "   󰱒 ",
        highlight = "RenderMarkdownChecked",
        scope_highlight = nil,
      },
    },

    backgrounds = {
      "Headline1Bg",
      "Headline2Bg",
      "Headline3Bg",
      "Headline4Bg",
      "Headline5Bg",
      "Headline6Bg",
    },

    foregrounds = {
      "Headline1Fg",
      "Headline2Fg",
      "Headline3Fg",
      "Headline4Fg",
      "Headline5Fg",
      "Headline6Fg",
    },
  },
})
