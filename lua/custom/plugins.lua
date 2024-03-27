local plugins = {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = require("custom.opts.copilot"),
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("custom.opts.treesitter"),
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      -- src: https://www.lazyvim.org/plugins/treesitter#nvim-treesitter-textobjects
      "nvim-treesitter/nvim-treesitter-textobjects",
      config = function()
        -- When in diff mode, we want to use the default
        -- vim text objects c & C instead of the treesitter ones.
        local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
        local configs = require("nvim-treesitter.configs")
        for name, fn in pairs(move) do
          if name:find("goto") == 1 then
            move[name] = function(q, ...)
              if vim.wo.diff then
                local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
                for key, query in pairs(config or {}) do
                  if q == query and key:find("[%]%[][cC]") then
                    vim.cmd("normal! " .. key)
                    return
                  end
                end
              end
              return fn(q, ...)
            end
          end
        end
      end,
    },
  },
  {
    "ThePrimeagen/vim-be-good",
    lazy = false,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  { "nvim-neotest/nvim-nio" },
  {
    "danymat/neogen",
    lazy = false,
    dependencies = "nvim-treesitter/nvim-treesitter",
    version = "*",
    config = function(_, opts)
      require("custom.configs.neogen")
      require("core.utils").load_mappings("neogen")
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = require("custom.configs.dap-ui"),
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "linux-cultist/venv-selector.nvim",
    },
    config = require("custom.configs.dap-python"),
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
  },
  {
    "folke/neodev.nvim",
    event = "BufEnter",
    -- Setup in config/lspconfig.lua
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- General
        "prettier",
        "prettierd",
        "typos",
        -- Python
        "codespell",
        "debugpy",
        "docformatter",
        "misspell",
        "mypy",
        "pylint",
        "pyright",
        "ruff",
        "ruff-lsp",
        -- Haskell
        "haskell-debug-adapter",
        "haskell-language-server",
        "fourmolu",
        -- Rust,
        "rust-analyzer",
        "codelldb", -- debugger
        -- Lua
        "lua-language-server",
        "luacheck",
        "luaformatter",
        "stylua",
        -- Bash / sh
        "shfmt",
        "shellcheck",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/neodev.nvim" },
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>fm",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    config = require("custom.configs.conform"),
  },
  {
    "mrcjkb/haskell-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    version = "^3", -- Recommended
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    config = function()
      require("custom.configs.haskell-tools")
    end,
  },
  {
    "luc-tielen/telescope_hoogle",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("hoogle")
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    opts = {},
    config = function()
      require("custom.configs.venv-selector")
      require("core.utils").load_mappings("venv_selector")
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = require("custom.configs.trouble"),
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "smoka7/hop.nvim",
    lazy = false,
    version = "*",
    opts = function()
      require("custom.configs.hop")
    end,
  },
  {
    "andweeb/presence.nvim",
    opts = function()
      require("custom.configs.presence")
    end,
    lazy = false,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}

return plugins
