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

return function()
  local dap = require("dap-python")
  dap.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
  dap.test_runner = "pytest"

  table.insert(require('dap').configurations.python,
    setmetatable({
        type = 'python',
        request = 'launch',
        name = "Debug Module (Poetry)",
        command = "poetry",
        module = "${relativeFileDirname}/${fileBasenameNoExtension}",
        -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
      },
      {
        __call = function(config)
          local fname = config.module
          config.module = fname:gsub("/", ".")
          config.args = "run python -m " .. config.module
          return config
        end
      }
    )
  )

  require("core.utils").load_mappings("dap_python")
end
