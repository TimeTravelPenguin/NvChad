-- I want to move all the comments to the line above the property.
-- To do this, I will use a macro


-- The setup config table shows all available config options with their default values:
require("presence").setup({
  -- General options
  -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
  buttons             = true,
  -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
  file_assets         = {},
})
