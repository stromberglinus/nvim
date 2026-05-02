if vim.g.vscode then
  return
end

local servers = require("plugins.lsp.servers")
local keymaps = require("plugins.lsp.keymaps")

-- Optional Lua development helper
pcall(function()
  require("lazydev").setup({
    library = {
      "luvit-meta/library",
    },
  })
end)

-- Disable LSP file watcher on Linux if available.
-- This can reduce overhead in large repos.
local ok_watchfiles, wf = pcall(require, "vim.lsp._watchfiles")
if ok_watchfiles then
  wf._watchfunc = function()
    return function() end
  end
end

-- Diagnostics
local ok_icons, icons_mod = pcall(require, "utils.icons")
local icons = ok_icons and icons_mod.diagnostics
  or {
    Error = "",
    Warn = "",
    Info = "",
    Hint = "",
  }

vim.diagnostic.config(require("plugins.lsp.diagnostics")(true))

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.Error,
      [vim.diagnostic.severity.WARN] = icons.Warn,
      [vim.diagnostic.severity.INFO] = icons.Info,
      [vim.diagnostic.severity.HINT] = icons.Hint,
    },
  },
})

-- Capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

capabilities.offsetEncoding = { "utf-16" }
capabilities.semanticTokensProvider = nil
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- clangd_extensions
pcall(function()
  require("clangd_extensions").setup({
    ast = {
      role_icons = {
        type = "",
        declaration = "",
        expression = "",
        specifier = "",
        statement = "",
        ["template argument"] = "",
      },
      kind_icons = {
        Compound = "",
        Recovery = "",
        TranslationUnit = "",
        PackExpansion = "",
        TemplateTypeParm = "",
        TemplateTemplateParm = "",
        TemplateParamObject = "",
      },
    },
  })
end)

-- Configure and enable servers
for server, config in pairs(servers) do
  if config then
    config = config == true and {} or vim.deepcopy(config)
    config.capabilities = vim.tbl_deep_extend("force", config.capabilities or {}, capabilities)

    vim.lsp.config(server, config)
    vim.lsp.enable(server)
  end
end

-- Attach keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if not client then
      return
    end

    vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

    keymaps.default(bufnr)

    if client.server_capabilities.inlayHintProvider then
      keymaps.inlay_hints(bufnr)
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    if client.name == "clangd" then
      keymaps.clangd(bufnr)
    end
  end,
})
