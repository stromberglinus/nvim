return {
  typos_lsp = {
    init_options = {
      diagnosticSeverity = "Hint",
    },
    filetypes = {
      "*",
    },
  },

  basedpyright = require("plugins.lsp.servers.basedPyright"),
  clangd = require("plugins.lsp.servers.clangd"),
  lua_ls = require("plugins.lsp.servers.lua_ls"),
  ts_ls = require("plugins.lsp.servers.ts_ls"),
  plantuml = require("plugins.lsp.servers.plantuml"),
}
