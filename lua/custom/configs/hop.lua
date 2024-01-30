local hop = require("hop")
local directions = require("hop.hint").HintDirection

-- Char1
vim.keymap.set("", "ghf", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set("", "ghF", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })

vim.keymap.set("", "ght", function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })

vim.keymap.set("", "ghT", function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })

-- Char2
vim.keymap.set("", "ghhf", function()
  hop.hint_char2({ direction = directions.AFTER_CURSOR })
end, { remap = true })

vim.keymap.set("", "ghhF", function()
  hop.hint_char2({ direction = directions.BEFORE_CURSOR })
end, { remap = true })

vim.keymap.set("", "ghht", function()
  hop.hint_char2({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
end, { remap = true })

vim.keymap.set("", "ghhT", function()
  hop.hint_char2({ direction = directions.BEFORE_CURSOR, hint_offset = 1 })
end, { remap = true })

-- Lines (Start)
vim.keymap.set("", "ghl", function()
  hop.hint_lines_skip_whitespace({ direction = directions.AFTER_CURSOR, hint_offset = -1 })
end, { remap = true })

vim.keymap.set("", "ghL", function()
  hop.hint_lines_skip_whitespace({ direction = directions.BEFORE_CURSOR, hint_offset = 1 })
end, { remap = true })

-- Words
vim.keymap.set("", "ghw", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR })
end, { remap = true })

vim.keymap.set("", "ghW", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, { remap = true })

-- Pattern
vim.keymap.set("", "ghs", function()
  hop.hint_patterns()
end, { remap = true })
