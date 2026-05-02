return function(bufnr)
  vim.keymap.set("n", "<leader>qi", function()
    vim.lsp.inlay_hint.enable(
      not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }),
      { bufnr = bufnr }
    )
  end, {
    buffer = bufnr,
    desc = "Toggle Inlay Hints current buffer",
  })

  vim.keymap.set("n", "<leader>qI", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}), {})
  end, {
    desc = "Toggle Inlay Hints",
  })
end
