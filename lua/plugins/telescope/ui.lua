-- File: plugins/telescope/ui.lua
local M = {}

M.layouts = {
    vertical = {
        mirror = false,
    },
    center = {
        preview_cutoff = 40,
    },
    horizontal = {
        prompt_position = "bottom",
        preview_cutoff = 120,
        preview_width = 0.55,
    },
    flex = {
        flip_columns = 140,
    },
    cursor = {
        preview_cutoff = 20,
    },
    small_cursor = {
        width = 0.5,
        height = 0.4,
    },
}

M.borderchars = {
    "─",
    "│",
    "─",
    "│",
    "╭",
    "╮",
    "╯",
    "╰",
}

return M
