local M = {}

M.panel = {
  auto_refresh = true,
  layout = {
    position = "bottom",
    ratio = 0.3
  },
}

M.suggestion = {
  auto_trigger = true,
}

M.filetypes = {
  python = true,
  haskell = true,
  lua = true,
  rust = true,
  bash = true,
  sh = true,
}

return M
