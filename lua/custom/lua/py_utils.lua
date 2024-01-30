local py_utils = {}

local toml = require("toml")

function py_utils.find_pyproject()
  return vim.fs.find("pyproject.toml", { type = "file" })
end

function py_utils.project_path(name)
end

-- print(py_utils.find_pyproject())

return py_utils
