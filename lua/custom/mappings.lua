local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Window up" },
    ["<C-u>"] = { "<C-u>zz", { desc = "Half page up", remap = false } },
    ["<C-d>"] = { "<C-d>zz", { desc = "Half page down", remap = false } },
  },
  x = {
    ["<leader>p"] = { "\"_dP", { silent = true, expr = true, remap = false } }
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
  }
}

local skip_opts = { skip_groups = true, jump = true }
M.trouble = {
  plugin = true,
  n = {
    ["tro"] = { "<cmd>Trouble<CR>", "Open Trouble" },
    ["trc"] = { "<cmd>TroubleClose<CR>", "Close Trouble" },
    ["trx"] = { "<cmd>TroubleToggle<CR>", "Toggle Trouble" },
    ["trw"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Set Trouble: Workplace" },
    ["trd"] = { "<cmd>TroubleToggle document_diagnostics<CR>", "Set Trouble: Documents" },
    ["trq"] = { "<cmd>TroubleToggle quickfix<CR>", "Set Trouble: Quickfix" },
    ["trL"] = { "<cmd>TroubleToggle loclist<CR>", "Set Trouble: Loclist" },
    ["trgR"] = { "<cmd>TroubleToggle lsp_references<CR>", "Set Trouble: LSP References" },

    ["trn"] = { "trouble.next", skip_opts, { desc = "Trouble: Next" } },
    ["trp"] = { "trouble.previous", skip_opts, { desc = "Trouble: Previous" } },
    ["trf"] = { "trouble.first", skip_opts, { desc = "Trouble: First" } },
    ["trl"] = { "trouble.last", skip_opts, { desc = "Trouble: Last" } },
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.lspconfig = {
  n = {
    ["[e"] = { vim.diagnostic.open_float },
  },
}

return M
