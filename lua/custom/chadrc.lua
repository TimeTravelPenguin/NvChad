---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "github_light" },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
