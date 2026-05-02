local conform = require("conform")

conform.setup({
  notify_on_error = false,

  format_on_save = function()
    if OPTIONS and OPTIONS.format_on_save and OPTIONS.format_on_save.value then
      return {
        timeout_ms = 500,
        lsp_fallback = true,
      }
    end

    return false
  end,

  formatters_by_ft = {
    ["_"] = { "trim_whitespace" },

    lua = { "stylua" },
    python = { "ruff_format" },
    css = { "stylelint" },

    javascript = {
      "prettierd",
      "prettier",
      "eslint_d",
      "eslint",
      stop_after_first = true,
    },

    typescript = {
      "prettierd",
      "prettier",
      "eslint_d",
      "eslint",
      stop_after_first = true,
    },

    json = { "fixjson" },
    markdown = { "markdownlint" },
    cpp = { "clang-format" },
  },
})

vim.keymap.set({ "n", "v" }, "<leader>d", function()
  conform.format({
    async = true,
    lsp_fallback = true,
  })
end, { desc = "Format" })
