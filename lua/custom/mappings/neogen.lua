local opts = { noremap = true, silent = true }

local M = {
  n = {
    ["<Leader>nf"] = { "<cmd>Neogen func<CR>", "Neogen: Document Function", opts },
    ["<leader>nc"] = { "<cmd>Neogen class<CR>", "Neogen: Document Class", opts },
    ["<leader>nt"] = { "<cmd>Neogen type<CR>", "Neogen: Document Type", opts },
    ["<leader>nF"] = { "<cmd>Neogen file<CR>", "Neogen: Document File", opts },
  },
}

return M
