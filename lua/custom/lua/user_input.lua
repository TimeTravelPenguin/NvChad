local M = {}

function M.RequestArgs()
  local argument_string = vim.fn.input("Program args: ")
  return vim.fn.split(argument_string, " ", true)
end

return M
