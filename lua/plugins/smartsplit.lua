if vim.g.vscode then
    return
end

local ok, ss = pcall(require, "smart-splits")
if not ok then
    -- plugin not installed/loaded yet
    return
end

ss.setup({
    ignored_filetypes = {
        "nofile",
        "quickfix",
        "prompt",
    },
    resize_mode = {
        silent = true,
        hooks = {
            on_enter = function()
                vim.notify("Entering resize mode")
            end,
            on_leave = function()
                vim.notify("Exiting resize mode, bye")
                return require("bufresize").register
            end,
        },
    },
    at_edge = "wrap",
})

local map = vim.keymap.set

-- moving between splits
map("n", "<C-h>", ss.move_cursor_left, { desc = "Move to left split" })
map("n", "<C-j>", ss.move_cursor_down, { desc = "Move to below split" })
map("n", "<C-k>", ss.move_cursor_up, { desc = "Move to above split" })
map("n", "<C-l>", ss.move_cursor_right, { desc = "Move to right split" })

-- resizing splits (also accept a range like 10<A-h>)
map("n", "<A-h>", ss.resize_left, { desc = "Resize left" })
map("n", "<A-j>", ss.resize_down, { desc = "Resize down" })
map("n", "<A-k>", ss.resize_up, { desc = "Resize up" })
map("n", "<A-l>", ss.resize_right, { desc = "Resize right" })

map("n", "<C-w><C-h>", ss.resize_left, { desc = "Resize left" })
map("n", "<C-w><C-j>", ss.resize_down, { desc = "Resize down" })
map("n", "<C-w><C-k>", ss.resize_up, { desc = "Resize up" })
map("n", "<C-w><C-l>", ss.resize_right, { desc = "Resize right" })

-- optional: buffer swapping (commented out by default)
-- map("n", "<leader><leader>h", ss.swap_buf_left)
-- map("n", "<leader><leader>j", ss.swap_buf_down)
-- map("n", "<leader><leader>k", ss.swap_buf_up)
-- map("n", "<leader><leader>l", ss.swap_buf_right)
