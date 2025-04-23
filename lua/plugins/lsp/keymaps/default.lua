return function(bufnr)
    local wk = require("which-key")
    wk.add({

        { "<c-s>", vim.lsp.buf.signature_help, buffer = bufnr, desc = "Signature" },
        { "<leader>a", vim.lsp.buf.code_action, buffer = bufnr, desc = "Apply fix" },
        { "<leader>r", buffer = bufnr, group = "Refactor" },
        { "<leader>rn", vim.lsp.buf.rename, buffer = bufnr, desc = "Rename" },
        { "g", buffer = bufnr, group = "Go to" },
        { "gD", vim.lsp.buf.declaration, buffer = bufnr, desc = "Go to declaration" },
        { "gd", vim.lsp.buf.definition, buffer = bufnr, desc = "Go to definition" },
        { "gi", vim.lsp.buf.implementation, buffer = bufnr, desc = "Go to implementation" },
        {
            "gr",
            require("fzf-lua").lsp_references,
            -- require("telescope.builtin").lsp_references({
            --     -- fname_width = require("utils.sizes").fname_width,
            --     include_declaration = false,
            --     include_current_line = true,
            --     jump_type = "never",
            -- }),
            buffer = bufnr,
            desc = "Go to references",
        },
    })
end
