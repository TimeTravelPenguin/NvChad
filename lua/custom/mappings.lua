local M = {}

M.disabled = {
  n = {
    ["<leader>fm"] = "",
    ["<B-r>"] = "",
    ["<B-R>"] = "",
  },
}

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
    ["n"] = { "nzzzv", "Next match", { remap = false } },
    ["N"] = { "Nzzzv", "Prev match", { remap = false } },
    ["<leader>h"] = { ":lua require('lsp-inlayhints').toggle()<CR>", "Toggle inlayhints" },
  },

  i = {
    ["<C-s>"] = { "<ESC><cmd> w <CR>", "Save file" },
  },

  x = {
    ["<leader>p"] = { '"_dP', "Paste without yanking", { silent = true, expr = true, remap = false } },
  },
}

M.dap = require("custom.mappings.dap")
M.dap_ui = require("custom.mappings.dap-ui")
M.dap_python = require("custom.mappings.dap-python")
M.neogen = require("custom.mappings.neogen")
M.trouble = require("custom.mappings.trouble")
M.venv_selector = require("custom.mappings.venv-selector")

return M
