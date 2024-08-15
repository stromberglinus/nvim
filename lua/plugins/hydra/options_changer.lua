local inlay_hint_enabled = vim.lsp.inlay_hint.is_enabled()

local function toggle_inlay_hint()
    vim.lsp.inlay_hint.enable(not inlay_hint_enabled)
    inlay_hint_enabled = not inlay_hint_enabled
    print("Inlay hints " .. (inlay_hint_enabled and "enabled" or "disabled"))
end

local function build_toggle_hint(name, key, description)
    local hint = "Toggle " .. description .. " (Press " .. key .. "): " .. (inlay_hint_enabled and "enabled" or "disabled")
    return { key, toggle_inlay_hint, { desc = hint } }
end

return function()
    local heads = {}
    local hint = [[
    ^^ Options
    ]]
    
    local key = "i"  -- Replace with your preferred keybinding
    local description = "Inlay Hints"
    table.insert(heads, build_toggle_hint("inlay_hint", key, description))
    
    hint = hint .. "\n" .. build_toggle_hint("inlay_hint", key, description)[3].desc
    table.insert(heads, { "<Esc>", nil, { exit = true, desc = "Exit" } })
    
    hint = hint .. "\n" .. [[
    ^^ _<Esc>_
    ]]
    
    return {
        name = "Options",
        hint = hint,
        config = {
            color = "amaranth",
            invoke_on_body = true,
            hint = {
                float_opts = {
                    border = "rounded",
                },
                position = "middle",
            },
        },
        mode = { "n", "x" },
        body = "<leader>C",  -- Replace with your preferred leader key combination
        heads = heads,
    }
end

