local M = {}

local function load_current_cmake_targets_to_dap(callback)
  local cmake_tools = require("cmake-tools")

  if not cmake_tools.is_cmake_project() then
    return
  end

  cmake_tools.get_cmake_launch_targets(function(targets)
    local target_configs = {}
    local build_type = tostring(cmake_tools.get_build_type().value)
    local launch_target = cmake_tools.get_launch_target()
    local launch_target_config = nil

    for k, v in pairs(targets.data.targets) do
      local config = {
        name = v .. " [" .. build_type .. "]",
        type = "cppdbg",
        request = "launch",
        args = "",
        program = targets.data.abs_paths[k],
        cwd = "${workspaceFolder}",
        stopAtEntry = false,
        setupCommands = {
          {
            text = "-enable-pretty-printing",
            description = "enable pretty printing",
            ignoreFailures = false,
          },
        },
      }

      if v == launch_target then
        launch_target_config = vim.tbl_deep_extend("force", {}, config, {
          name = "* " .. v .. " [" .. build_type .. "]",
        })
      end

      table.insert(target_configs, config)
    end

    local dap = require("dap")
    dap.configurations.cpp = {}
    vim.list_extend(dap.configurations.cpp, target_configs)

    if callback then
      callback(launch_target_config)
    end
  end)
end

function M.configure()
  require("cmake-tools").generate({}, function() end)
end

function M.build()
  local cmake_tools = require("cmake-tools")

  cmake_tools.quick_build({
    fargs = {
      cmake_tools.get_build_target(),
    },
  })
end

function M.debug()
  load_current_cmake_targets_to_dap(function(launch_target_config)
    vim.cmd("cclose")

    if not launch_target_config then
      vim.notify("No CMake launch target selected", vim.log.levels.WARN)
      return
    end

    require("dap").run(launch_target_config)
  end)
end

function M.close_debug_session()
  require("dap").terminate()

  local ok, dapui = pcall(require, "dapui")
  if ok then
    dapui.close()
  end
end

function M.select_build_target()
  require("cmake-tools").select_build_target({}, {})
end

function M.select_launch_target()
  require("cmake-tools").select_launch_target({}, {})
end

function M.select_configure_preset()
  require("cmake-tools").select_configure_preset()
end

function M.select_build_preset()
  require("cmake-tools").select_build_preset()
end

function M.select_presets()
  require("cmake-tools").select_configure_preset(function()
    require("cmake-tools").select_build_preset()
  end)
end

return M
