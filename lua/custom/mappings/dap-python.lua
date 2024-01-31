local opts = { noremap = true, silent = true }

local M = {
  n = {
    ["<leader>dn"] = { ":lua require('dap-python').test_method()<CR>", "python-dap: Test method", opts },
    ["<leader>df"] = { ":lua require('dap-python').test_class()<CR>", "python-dap: Test class", opts },
  },

  v = {
    ["<leader>ds"] = { "<ESC>:lua require('dap-python').debug_selection()<CR>", "python-dap: Debug selected", opts },
  },
}

return M
