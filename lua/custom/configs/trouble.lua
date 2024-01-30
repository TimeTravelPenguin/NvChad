return function()
  local actions = require("telescope.actions")
  local trouble = require("trouble.providers.telescope")

  local telescope = require("telescope")

  telescope.setup {
    defaults = {
      mappings = {
        n = {
          ["<c-t>"] = trouble.open_with_trouble,
        },

        i = {
          ["<c-t>"] = trouble.open_with_trouble,
        },
      },
    },
  }
end
