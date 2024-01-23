-- local trouble = require("trouble")

-- local map = vim.keymap.set
--
-- map("n", "tro", trouble.open, { desc = "Open Trouble" })
-- map("n", "trc", trouble.close, { desc = "Clode Trouble" })
-- map("n", "trx", trouble.toggle, { desc = "Toggle Trouble" })
-- map("n", "trw", function() trouble.toggle("workspace_diagnostics") end, { desc = "Set Trouble: Workplace" })
-- map("n", "trd", function() trouble.toggle("document_diagnostics") end, { desc = "Set Trouble: Documents" })
-- map("n", "trq", function() trouble.toggle("quickfix") end, { desc = "Set Trouble: Quickfix" })
-- map("n", "trL", function() trouble.toggle("loclist") end, { desc = "Set Trouble: Loclist" })
-- map("n", "trgR", function() trouble.toggle("lsp_references") end, { desc = "Set Trouble: LSP References" })
--
-- local skip_opts = { skip_groups = true, jump = true }
-- map("n", "trn", function() trouble.next(skip_opts) end, { desc = "Trouble: Next" })
-- map("n", "trp", function() trouble.previous(skip_opts) end, { desc = "Trouble: Previous" })
-- map("n", "trf", function() trouble.first(skip_opts) end, { desc = "Trouble: First" })
-- map("n", "trl", function() trouble.last(skip_opts) end, { desc = "Trouble: Last" })

-- Telescope

local actions = require("telescope.actions")
local trouble_provider = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble_provider.open_with_trouble },
      n = { ["<c-t>"] = trouble_provider.open_with_trouble },
    },
  },
}

local opts = {
  use_diagnostic_signs = true,
}

return opts
