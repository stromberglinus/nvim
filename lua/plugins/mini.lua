return {
    { -- Collection of various small independent plugins/modules
        "echasnovski/mini.nvim",
        config = function()
            -- Better Around/Inside textobjects
            --
            -- Examples:
            --  - va)  - [V]isually select [A]round [)]paren
            --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
            --  - ci'  - [C]hange [I]nside [']quote
            require("mini.ai").setup({ n_lines = 500 })
        end,
    },
    {
        "echasnovski/mini.surround",
        version = false,
        event = "BufEnter",
        opts = {
            custom_surroundings = {
                ["("] = { input = { "%b()", "^.().*().$" }, output = { left = "(", right = ")" } },
                ["["] = { input = { "%b[]", "^.().*().$" }, output = { left = "[", right = "]" } },
                ["{"] = { input = { "%b{}", "^.().*().$" }, output = { left = "{", right = "}" } },
                ["<"] = { input = { "%b<>", "^.().*().$" }, output = { left = "<", right = ">" } },
            },
        },
        config = function()
            require("mini.surround").setup()
        end,
    },
}
