return {
    {
        "willem-J-an/adopure.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-neotest/nvim-nio",
        },
        opts = {
            preferred_remotes = {
                "",
            },
        },
        config = function(_, opts)
            local nio = require("nio")
            nio.run(function()
                local secret_job =
                    nio.process.run({ cmd = "echo", args = { "$AZURE_DEVOPS_EXT_PAT" } })
                if secret_job then
                    vim.tbl_extend("force", opts, {
                        pat_token = secret_job.stdout.read():sub(1, -2),
                    })
                end

                vim.g.adopure = opts
            end)

            local function set_keymap(keymap, command)
                vim.keymap.set({ "n", "v" }, keymap, function()
                    vim.cmd(command)
                end, { desc = command })
            end
            -- Set keymaps for Adopure commands with descriptions
            set_keymap("<leader>Alc", "AdoPure load context")
            set_keymap("<leader>Alt", "AdoPure load threads")
            set_keymap("<leader>Aoq", "AdoPure open quickfix")
            set_keymap("<leader>Aot", "AdoPure open thread_picker")
            set_keymap("<leader>Aon", "AdoPure open new_thread")
            set_keymap("<leader>Aoe", "AdoPure open existing_thread")
            set_keymap("<leader>Asc", "AdoPure submit comment")
            set_keymap("<leader>Asv", "AdoPure submit vote")
            set_keymap("<leader>Ast", "AdoPure submit thread_status")
        end,
    },
}
