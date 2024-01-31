local M = {}

M.formatters_by_ft = {
  lua = { "stylua" },
  sh = { "prettier", "shellcheck", "shfmt" },
  bash = { "shellcheck", "shfmt" },
  python = { "ruff_format", "ruff_fix" },
  json = { "prettier" },
  markdown = { "prettier" },
  html = { "prettier" },
  css = { "prettier" },
  xml = { "prettier" },
  yaml = { "prettier" },
  toml = { "prettier" },
  javascript = { "prettier" },
  haskell = { "fourmolu" },
}

-- Set up format-on-save
M.format_on_save = function(bufnr)
  -- Disable with a global or buffer-local variable
  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
    return
  end
  return { timeout_ms = 500, lsp_fallback = true }
end

-- Command to toggle formatting on save
vim.api.nvim_create_user_command("ToggleFormatOnSave", function(args)
  if args.bang then
    -- ToggleFormatOnSave! will disable formatting just for this buffer
    vim.b.disable_autoformat = not vim.b.disable_autoformat
  else
    vim.g.disable_autoformat = not vim.g.disable_autoformat
  end
end, {
  desc = "Toggle autoformat-on-save",
  bang = true,
})

-- Customize formatters
M.formatters = {
  shfmt = {
    prepend_args = { "-i", "2" },
  },
}

return function()
  require("conform").setup(M)

  require("conform").formatters.prettier = {
    options = {
      -- Use a specific prettier parser for a filetype
      -- Otherwise, prettier will try to infer the parser from the file name
      ft_parsers = {
        toml = "toml",
        xml = "xml",
      },
    },
  }
end
