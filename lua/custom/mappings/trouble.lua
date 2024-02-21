local opts = { skip_groups = true, jump = true }

local M = {
  n = {
    ["tro"] = { "<cmd>Trouble<CR>", "Open Trouble" },
    ["trc"] = { "<cmd>TroubleClose<CR>", "Close Trouble" },
    ["trx"] = { "<cmd>TroubleToggle<CR>", "Toggle Trouble" },
    ["trw"] = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Set Trouble: Workplace" },
    ["trd"] = { "<cmd>TroubleToggle document_diagnostics<CR>", "Set Trouble: Documents" },
    ["trq"] = { "<cmd>TroubleToggle quickfix<CR>", "Set Trouble: Quickfix" },
    ["trL"] = { "<cmd>TroubleToggle loclist<CR>", "Set Trouble: Loclist" },
    ["trgR"] = { "<cmd>TroubleToggle lsp_references<CR>", "Set Trouble: LSP References" },

    ["trn"] = { ":lua require('trouble').next({ skip_groups = true, jump = true })<CR>", "Trouble: Next" },
    ["trp"] = { ":lua require('trouble').previous({ skip_groups = true, jump = true })<CR>", "Trouble: Previous" },
    ["trf"] = { ":lua require('trouble').first({ skip_groups = true, jump = true })<CR>", "Trouble: First" },
    ["trl"] = { ":lua require('trouble').last({ skip_groups = true, jump = true })<CR>", "Trouble: Last" },
  },
}

return M
