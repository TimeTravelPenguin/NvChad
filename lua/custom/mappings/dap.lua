local M = {
  n = {
    ["<F5>"] = { "<cmd>DapContinue<CR>", "Dap: Run" },
    ["<F10>"] = { "<cmd>DapStepOver<CR>", "Dap: Step Over" },
    ["<F11>"] = { "<cmd>DapStepInto<CR>", "Dap: Step Into" },
    ["<F12>"] = { "<cmd>DapStepOut<CR>", "Dap: Step Out" },
    ["<Leader>b"] = { "<cmd>DapToggleBreakpoint<CR>", "Dap: Toggle Breakpoint" },
    ["<Leader>lp"] = {
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end,
      "Dap: Set Logpoint",
    },
    ["<Leader>dr"] = { "<cmd>DapToggleRepl<CR>", "Dap: Toggle Repl" },
    ["<Leader>dl"] = {
      function()
        require("dap").run_last()
      end,
      "Dap: Run Last",
    },
  },
}

return M
