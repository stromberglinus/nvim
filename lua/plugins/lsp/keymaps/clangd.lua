return function(bufnr)
    local wk = require("which-key")
    wk.register({
        o = {
            "<cmd>ClangdSwitchSourceHeader<CR>",
            "Switch Header/Source",
        },
        O = {
            "<cmd>vsplit | ClangdSwitchSourceHeader<CR>",
            "Switch Header/Source (vsplit)",
        },
    }, {
        prefix = "<leader>",
        buffer = bufnr,
    })
end
