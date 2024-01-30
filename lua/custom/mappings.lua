local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "Window left" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "Window right" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "Window down" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "Window up" },
    ["<C-u>"] = { "<C-u>zz", "Half page up", { remap = false } },
    ["<C-d>"] = { "<C-d>zz", "Half page down", { remap = false } },
    ["<leader>ln"] = { "<cmd>set nu!<CR>", "Toggle line number" },
    ["<leader>lrn"] = { "<cmd>set rnu!<CR>", "Toggle relative line number" },
    ["n"] = { "nzzzv", "Next match", { remap = false, }, },
    ["N"] = { "Nzzzv", "Prev match", { remap = false, }, },
  },
  x = {
    ["<leader>p"] = { "\"_dP", "Paste without yanking", { silent = true, expr = true, remap = false } }
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<F5>"] = { "<cmd>DapContinue<CR>", "Dap: Run" },
    ["<F10>"] = { "<cmd>DapStepOver<CR>", "Dap: Step Over" },
    ["<F11>"] = { "<cmd>DapStepInto<CR>", "Dap: Step Into" },
    ["<F12>"] = { "<cmd>DapStepOut<CR>", "Dap: Step Out" },
    ["<Leader>b"] = { "<cmd>DapToggleBreakpoint<CR>", "Dap: Toggle Breakpoint" },
    ["<Leader>lp"] = {
      function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
      "Dap: Set Logpoint",
    },
    ["<Leader>dr"] = { "<cmd>DapToggleRepl<CR>", "Dap: Toggle Repl" },
    ["<Leader>dl"] = { function() require('dap').run_last() end, "Dap: Run Last" },
  },
}

M.dap_ui = {
  plugin = true,
  n = {
    ["<Leader>df"] = { function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end },
    ["<Leader>ds"] = { function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end },
    ["<Leader>dh"] = { function()
      require('dap.ui.widgets').hover()
    end },
    ["<Leader>dp"] = { function()
      require('dap.ui.widgets').preview()
    end },
  },

  v = {
    ["<Leader>dh"] = { function()
      require('dap.ui.widgets').hover()
    end },
    ["<Leader>dp"] = { function()
      require('dap.ui.widgets').preview()
    end },
  },
}

local opts = { noremap = true, silent = true }
M.neogen = {
  plugin = true,
  n = {
    -- ["<leader>nf"] = { ":lua require('neogen').generate({ type = 'func' })<CR>", opts },
    ["<Leader>nf"] = { "<cmd>Neogen func<CR>", "Neogen: Document Function", opts },
    ["<leader>nc"] = { "<cmd>Neogen class<CR>", "Neogen: Document Class", opts },
    ["<leader>nt"] = { "<cmd>Neogen type<CR>", "Neogen: Document Type", opts },
    ["<leader>nF"] = { "<cmd>Neogen file<CR>", "Neogen: Document File", opts },
  },
}

M.trouble = require("custom.mappings.trouble")
-- require("core.utils").load_mappings("trouble")

local opts = { noremap = true, silent = true }
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dn"] = { ":lua require('dap-python').test_method()<CR>", "python-dap: Test method", opts },
    ["<leader>df"] = { ":lua require('dap-python').test_class()<CR>", "python-dap: Test class", opts },
  },
  v = {
    ["<leader>ds"] = { "<ESC>:lua require('dap-python').debug_selection()<CR>", "python-dap: Debug selected", opts },
  },
}

M.venv_selector = {
  plugin = true,
  n = {
    ["<leader>vs"] = { "<cmd>VenvSelect<cr>", "VenvSelector" },
    ["<leader>vc"] = { "<cmd>VenvSelectCached<cr>", "VenvSelector (Cache)" },
  }
}


return M
