local utils = require("plugins.cmake.utils")

require("cmake-tools").setup({
  cmake_soft_link_compile_commands = false,
  cmake_virtual_text_support = false,
  cmake_compile_commands_from_lsp = true,
  cmake_build_options = { "-j32" },
  cmake_executor = require("plugins.cmake.toggleterm"),
  cmake_regenerate_on_save = false,
  cmake_runner = require("plugins.cmake.toggleterm"),

  cmake_dap_configuration = {
    name = "cpp",
    type = "cppdbg",
    request = "launch",
    stopOnEntry = false,
    runInTerminal = true,
    console = "integratedTerminal",
  },

  cmake_notifications = {
    runner = { enabled = false },
    executor = { enabled = false },
    spinner = {
      "⠋",
      "⠙",
      "⠹",
      "⠸",
      "⠼",
      "⠴",
      "⠦",
      "⠧",
      "⠇",
      "⠏",
    },
    refresh_rate_ms = 100,
  },
})

vim.keymap.set("n", "<leader>cp", utils.select_presets, {
  desc = "Select CMakePresets",
})

vim.keymap.set("n", "<leader>ct", utils.select_build_target, {
  desc = "Select build target",
})

vim.keymap.set("n", "<leader>cl", utils.select_launch_target, {
  desc = "Select launch target",
})

vim.keymap.set("n", "<leader>cc", utils.configure, {
  desc = "Run CMake",
})

vim.keymap.set("n", "<leader>cb", utils.build, {
  desc = "Build selected build target",
})

vim.keymap.set("n", "<leader>cd", utils.debug, {
  desc = "Debug start/continue",
})

vim.keymap.set("n", "<leader>cs", utils.close_debug_session, {
  desc = "Debug stop",
})
