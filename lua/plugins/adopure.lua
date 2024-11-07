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
            set_keymap("<leader>Alc", "load pull request", "Load Context")
            set_keymap("<leader>Alt", "load threads", "Load Threads")
            set_keymap("<leader>Aoq", "open quickfix", "Open Quickfix")
            set_keymap("<leader>Aot", "open thread_picker", "Open Thread Picker")
            set_keymap("<leader>Aon", "open new_thread", "Open New Thread")
            set_keymap("<leader>Aoe", "open existing_thread", "Open Existing Thread")
            set_keymap("<leader>Asc", "submit comment", "Submit Comment")
            set_keymap("<leader>Asv", "submit vote", "Submit Vote")
            set_keymap("<leader>Ast", "submit thread_status", "Submit Thread Status")
        end,
    },
}
