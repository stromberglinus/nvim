return {
    {
        "catppuccin/nvim",
        cond = not vim.g.vscode,
        priority = 1000,
        name = "catppuccin",
        lazy = false,
        opts = {
            flavour = "mocha",
            background = {
                light = "frappe",
                dark = "mocha",
            },
            transparent_background = false,
            no_italic = true,
            no_bold = true,
            no_underline = true,
            term_colors = true,
            dim_inactive = {
                enabled = false,
                shade = "dark",
                percentage = 0.10,
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            styles = {
                comments = { "bold" },
                properties = { "italic" },
                functions = { "italic", "bold" },
                keywords = { "italic" },
                operators = { "bold" },
                conditionals = { "bold" },
                loops = { "bold" },
                booleans = { "bold", "italic" },
                numbers = {},
                types = { "italic" },
                strings = {},
                variables = {},
            },
            integrations = {
                alpha = true,
                beacon = true,
                cmp = true,
                colorful_winsep = {
                    enabled = true,
                    color = "pink",
                },
                dashboard = true,
                diffview = true,
                gitsigns = true,
                fidget = true,
                harpoon = false,
                illuminate = true,
                semantic_tokens = true,
                dap = true,
                dap_ui = true,
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = true,
                },
                leap = true,
                mason = true,
                markdown = true,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
                window_picker = true,
                ts_rainbow = true,
                flash = true,
                ufo = true,
                noice = true,
                lsp_trouble = true,
                telescope = {
                    enabled = true,
                    style = "nvchad",
                },
                treesitter = true,
                treesitter_context = true,
                rainbow_delimiters = true,
                notify = true,
                native_lsp = {
                    enabled = true,
                    virtual_text = {
                        errors = { "italic" },
                        hints = { "italic" },
                        warnings = { "italic" },
                        information = { "italic" },
                    },
                    underlines = {
                        errors = { "underline" },
                        hints = { "underline" },
                        warnings = { "underline" },
                        information = { "underline" },
                    },
                    inlay_hints = {
                        background = true,
                    },
                },
                which_key = true,
            },
            custom_highlights = function(c)
                return {
                    Normal = { bg = c.mantle }, -- darkest in catppuccin
                    NormalNC = { bg = c.mantle },
                    FloatBorder = { bg = c.mantle },
                    NormalFloat = { bg = c.mantle },
                    TelescopeNormal = { bg = c.mantle },
                    Pmenu = { bg = c.mantle },

                    HighlightUndo = { bg = c.overlay0 },
                    CopilotSuggestion = { fg = c.surface1 },
                    InclineText = { fg = c.mauve, bg = c.surface0, style = { "bold" } },
                    InclineTextInactive = { fg = c.text, bg = c.surface0 },
                    InclineReverse = { fg = c.surface0, bg = c.base, style = { "bold" } },
                    InclineModified = { fg = c.red, bg = c.surface0, style = { "bold", "italic" } },
                    MarkSignHL = { fg = c.yellow, style = { "bold" } },
                    NoiceCursor = { bg = c.text, fg = c.base, blend = 0 },
                }
            end,
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            local colors = require("catppuccin.palettes").get_palette()
            colors.none = "NONE"
        end,
    },
}
