local function py_path()
  local active_path = require("venv-selector").get_active_path()

  -- Check if a venv is currently set
  if active_path ~= nil and active_path ~= "" then
    -- Check if debugpy installed
    local handle = io.popen("pip show debugpy")
    local exitcode = handle:close()

    if exitcode == 0 then
      return active_path
    end
  end

  -- If venv is not set, or debugpy is not installed there, fallback to debugpy, which is installed by Mason
  return "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
end

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

return function()
  local dap = require("dap-python")
  dap.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
  dap.test_runner = "pytest"

  local module_path = vim.fn.expand("%:p")
  local module_name = convert_module_name(module_path)

  table.insert(
    require("dap").configurations.python,
    -- setmetatable(
    {
      type = "python",
      request = "launch",
      name = "Debug Module (Poetry)",
      -- command = "poetry",
      -- module = "${relativeFileDirname}/${fileBasenameNoExtension}",
      module = module_name,
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
