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

    ["trn"] = { "require('trouble').next", "Trouble: Next", opts },
    ["trp"] = { "require('trouble').previous", "Trouble: Previous", opts },
    ["trf"] = { "require('trouble').first", "Trouble: First", opts },
    ["trl"] = { "require('trouble').last", "Trouble: Last", opts },
  },
}

return M
