return function(bufnr)
  local wk = require("which-key")
  local Snacks = require("snacks")

  wk.add({
    { "<c-s>", vim.lsp.buf.signature_help, buffer = bufnr, desc = "Signature" },
    { "<leader>a", vim.lsp.buf.code_action, buffer = bufnr, desc = "Apply fix" },

    { "<leader>r", buffer = bufnr, group = "Refactor" },
    { "<leader>rn", vim.lsp.buf.rename, buffer = bufnr, desc = "Rename" },

    { "g", buffer = bufnr, group = "Go to" },
    { "gD", vim.lsp.buf.declaration, buffer = bufnr, desc = "Go to declaration" },
    { "gd", Snacks.picker.lsp_definitions, buffer = bufnr, desc = "Go to definition" },
    { "gi", Snacks.picker.lsp_implementations, buffer = bufnr, desc = "Go to implementation" },
    { "gr", Snacks.picker.lsp_references, buffer = bufnr, desc = "Go to references" },
  })
end
