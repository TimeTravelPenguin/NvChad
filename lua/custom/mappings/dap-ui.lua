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
    ["<leader>dx"] = {
      function()
        require("dapui").close()
      end,
      "DAP: Close",
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
    ["<leader>dx"] = {
      function()
        require("dapui").close()
      end,
      "DAP: Close",
    },
  },
}

return M
