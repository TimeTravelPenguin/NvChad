require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
  on_init = function(client)
    local path = client.workspace_folders[1].name

    client.server_capabilities.documentRangeFormattingProvider = false
    if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
      client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
            },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end,
})

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    Python = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
})

lspconfig.ruff_lsp.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    client.server_capabilities.hoverProvider = false
  end,
  -- capabilities = capabilities,
  filetypes = { "python" },
  init_options = {
    settings = {
      Python = {
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "[e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local function quickfix()
      vim.lsp.buf.code_action({
        filter = function(a)
          return a.isPreferred
        end,
        apply = true,
      })
    end

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local function bufopts_withdesc(desc)
      return { noremap = true, silent = true, buffer = ev.buf, desc = desc }
    end

    vim.keymap.set("n", "<leader>qf", quickfix, bufopts_withdesc("Quickfix"))
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts_withdesc("Declaration"))
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts_withdesc("Definition"))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts_withdesc("Hover"))
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts_withdesc("Implementation"))
    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, bufopts_withdesc("Signature Help"))
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts_withdesc("Add Workspace Folder"))
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts_withdesc("Remove Workspace Folder"))
    vim.keymap.set("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts_withdesc("List Workspace Folders"))
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts_withdesc("Type Definition"))
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts_withdesc("Rename"))
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts_withdesc("Code Action"))
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts_withdesc("References"))
    -- Formatting done by conform.nvim
    -- vim.keymap.set("n", "<leader>fm", function()
    --   vim.lsp.buf.format({ async = true })
    -- end, bufopts)
  end,
})

vim.g.rustaceanvim = {
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      local opts = { silent = true, buffer = bufnr }

      local function codeAction()
        vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
        -- or vim.lsp.buf.codeAction() if you don't want grouping.
      end

      vim.keymap.set("n", "<leader>a", codeAction, { silent = true, buffer = bufnr, desc = "Rust Code Action" })

      local function rustRunArgs()
        local input = require("custom.lua.user_input")
        local args = vim.fn.input("Program args: ")
        vim.cmd("<cmd>RustRun -- " .. args)
      end

      vim.keymap.set("n", "<leader>ddr", "<cmd>RustRun<CR>", { silent = true, buffer = bufnr, desc = "RustRun" })
      vim.keymap.set("n", "<leader>ddR", function()
        vim.defer_fn(rustRunArgs, 100)
      end, { silent = true, buffer = bufnr, desc = "RustRun (args)" })
    end,

    default_settings = {
      -- rust-analyzer language server configuration
      ["rust-analyzer"] = {},
    },
  },
}
