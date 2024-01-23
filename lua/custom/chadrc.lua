---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "github_light" },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.opt.colorcolumn = "120"
vim.wo.relativenumber = true

return M
