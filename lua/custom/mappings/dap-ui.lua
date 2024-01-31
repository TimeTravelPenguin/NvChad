local M = {
  n = {
    ["<Leader>df"] = {
      function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.frames)
      end,
      "DAP: Frames",
    },
    ["<Leader>ds"] = {
      function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.scopes)
      end,
      "DAP: Scopes",
    },
    ["<Leader>dh"] = {
      function()
        require("dap.ui.widgets").hover()
      end,
      "DAP: Hover",
    },
    ["<Leader>dp"] = {
      function()
        require("dap.ui.widgets").preview()
      end,
      "DAP: Preview",
    },
  },

  v = {
    ["<Leader>dh"] = {
      function()
        require("dap.ui.widgets").hover()
      end,
      "DAP: Hover",
    },
    ["<Leader>dp"] = {
      function()
        require("dap.ui.widgets").preview()
      end,
      "DAP: Preview",
    },
  },
}

return M
