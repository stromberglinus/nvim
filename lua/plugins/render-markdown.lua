return {
    "MeanderingProgrammer/render-markdown.nvim",
    -- cmd = { "RenderMarkdown" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        heading = {
            enabled = true,
            sign = true,
            icons = { " ", " ", " ", " ", " ", " " },
            -- width = 'block',
            backgrounds = {
                "RenderMarkdownH4Bg",
                "RenderMarkdownH5Bg",
                "RenderMarkdownH6Bg",
                "RenderMarkdownH1Bg",
                "RenderMarkdownH2Bg",
                "RenderMarkdownH3Bg",
            },
       },
    },
    config = function(_, opts)
        require("obsidian").get_client().opts.ui.enable = false
        vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_get_namespaces()["ObsidianUI"], 0, -1)
        require("render-markdown").setup(opts)
    end,
}
