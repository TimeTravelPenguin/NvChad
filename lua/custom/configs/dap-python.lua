--[[
Supported variables:
  - `${file}`: Active filename
  - `${fileBasename}`: The current file's basename
  - `${fileBasenameNoExtension}`: The current file's basename without extension
  - `${fileDirname}`: The current file's dirname
  - `${fileExtname}`: The current file's extension
  - `${relativeFile}`: The current file relative to |getcwd()|
  - `${relativeFileDirname}`: The current file's dirname relative to |getcwd()|
  - `${workspaceFolder}`: The current working directory of Neovim
  - `${workspaceFolderBasename}`: The name of the folder opened in Neovim
  - `${command:pickProcess}`: Open dialog to pick process using |vim.ui.select|
  - `${env:Name}`: Environment variable named `Name`, for example: `${env:HOME}`.
  ]]

local function convert_module_name(module_path)
  local handle = io.popen(string.format("./scripts/convert_module_name.py . %s", module_path))
  local result = handle:read("*l")

  if handle:close() then
    return result
  end

  return nil
end

local function poetry_py_path()
  local handle_poetry = io.popen("poetry env info --path")
  local poetry = handle_poetry:read("*l")

  if handle_poetry:close() and poetry ~= nil and poetry ~= "" then
    return poetry .. "/bin/python"
  end

  local active_path = require("venv-selector").get_active_path()

  -- Check if a venv is currently set
  if active_path ~= nil and active_path ~= "" then
    -- Check if debugpy installed
    local handle_debugpy = io.popen("pip show debugpy")

    if handle_debugpy:close() then
      return active_path .. "/bin/python"
    end
  end

  -- If poetry venv is not set, or debugpy is not installed there,
  -- fallback to debugpy, which is installed by Mason
  return "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
end

return function()
  local dap = require("dap-python")
  -- dap.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
  local py_path = poetry_py_path()
  dap.setup(py_path)
  dap.test_runner = "pytest"

  local module_path = vim.fn.expand("%:p")
  local module_name = convert_module_name(module_path)

  table.insert(
    require("dap").configurations.python,
    -- setmetatable(
    {
      type = "python",
      request = "launch",
      name = "Debug (Poetry)",
      module = "BAET.debug",
      args = require("custom.lua.user_input").RequestArgs,
      -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
    }
    -- , {
    --   __call = function(config)
    --     local fname = config.module
    --     config.module = fname:gsub("/", ".")
    --     config.args = "run python -m " .. config.module
    --     return config
    --   end,
    -- })
  )
end
