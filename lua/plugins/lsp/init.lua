return {
    {
        -- Lua LSP configuration for Neovim development
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                "luvit-meta/library",
            },
        },
    },
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        cond = not vim.g.vscode,
        opts = {
            ensure_installed = {
                -- NOTE: LSP
                "basedpyright",
                "clangd",
                "cmake-language-server",
                "lua-language-server",
                "marksman",

                -- NOTE: LINT
                "buf",
                "buildifier",
                "cmakelint",
                "eslint_d",
                "hadolint",
                "jsonlint",
                "luacheck",
                "markdownlint",
                "shellcheck",
                "stylelint",

                -- NOTE: FORMAT
                "autoflake",
                "clang-format",
                "autopep8",
                "beautysh",
                "fixjson",
                "prettier",
                "prettierd",
                "shfmt",
                "stylua",
            },
            pip = {
                upgrade_pip = true,
            },
            diagnostics = require("plugins.lsp.diagnostics")(true),
        },
        config = function(_, opts)
            require("mason").setup(opts)
            local mr = require("mason-registry")
            for _, tool in ipairs(opts.ensure_installed) do
                local p = mr.get_package(tool)
                if not p:is_installed() then
                    p:install()
                end
            end
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        cond = not vim.g.vscode,
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "onsails/lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp",
            {
                "p00f/clangd_extensions.nvim",
                dependencies = {
                    "mortepau/codicons.nvim",
                },
                lazy = true,
                config = function() end,
                opts = {
                    ast = {
                        --These require codicons (https://github.com/microsoft/vscode-codicons)
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
                },
            },
        },
        opts = {
            diagnostics = {
                underline = true,
                update_in_insert = false,
                severity_sort = true,
                virtual_text = false,
            },
            -- Automatically format on save
            autoformat = true,
            format = {
                formatting_options = nil,
                timeout_ms = nil,
            },
            setup = {},
            servers = require("plugins.lsp.servers"),
        },
        config = function(_, opts)
            local ok, wf = pcall(require, "vim.lsp._watchfiles")
            if ok then
                -- disable lsp watcher. Too slow on linux
                wf._watchfunc = function()
                    return function() end
                end
            end

            local lspconfig = require("lspconfig")

            for type, icon in pairs(require("utils.icons").diagnostics) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, {
                    text = icon,
                    texthl = hl, --[[numhl = hl]]
                })
            end

            vim.diagnostic.config(opts.diagnostics)

            local servers = opts.servers
            local capabilities = require("cmp_nvim_lsp").default_capabilities(
                vim.lsp.protocol.make_client_capabilities()
            )

            -- Specify otherwise clangd seems to use utf-8.
            capabilities.offsetEncoding = { "utf-16" }
            capabilities.semanticTokensProvider = nil
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true,
            }

            local function setup(server)
                local server_opts = vim.tbl_deep_extend("force", {
                    capabilities = vim.deepcopy(capabilities),
                }, servers[server] or {})

                if opts.setup[server] then
                    if opts.setup[server](server, server_opts) then
                        return
                    end
                elseif opts.setup["*"] then
                    if opts.setup["*"](server, server_opts) then
                        return
                    end
                end
                lspconfig[server].setup(server_opts)
            end

            local mlsp = require("mason-lspconfig")
            local available = mlsp.get_available_servers()

            local ensure_installed = {}
            for server, server_opts in pairs(servers) do
                if server_opts then
                    server_opts = server_opts == true and {} or server_opts
                    -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
                    if server_opts.mason == false or not vim.tbl_contains(available, server) then
                        setup(server)
                    else
                        ensure_installed[#ensure_installed + 1] = server
                    end
                end
            end

            require("mason-lspconfig").setup({ ensure_installed = ensure_installed })
            require("mason-lspconfig").setup_handlers({ setup })

            -- LspAttach
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)

                    if client == nil then
                        return
                    end

                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    -- Mappings
                    require("plugins.lsp.keymaps").default(bufnr)
                    if client.server_capabilities.inlayHintProvider then
                        require("plugins.lsp.keymaps").inlay_hints(bufnr)
                        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                    end

                    if client.name == "clangd" then
                        require("plugins.lsp.keymaps").clangd(bufnr)
                    end
                    -- Normal Mode
                end,
            })
        end,
    },
}
