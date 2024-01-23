local null_ls = require("null-ls")

local builtins = null_ls.builtins
local formatting = builtins.formatting
local code_actions = builtins.code_actions
local completion = builtins.completion
local diagnostics = builtins.diagnostics

local py_sources = {
  name = "Python_Sources",
  filetypes = { "python" },
  sources = {
    formatting.docformatter,
    formatting.ruff,
    formatting.ruff_format,
    diagnostics.bandit,
    diagnostics.mypy,
    diagnostics.pylint,
    diagnostics.ruff,
  }
}

local hs_sources = {
  name = "Haskell_Sources",
  filetypes = { "haskell" },
  sources = {
    formatting.fourmolu,
  }
}

local sh_sources = {
  name = "Shell_Sources",
  filetypes = { "bash", "sh", "zsh" },
  sources = {
    formatting.beautysh,
    formatting.shellharden,
    diagnostics.shellcheck,
    diagnostics.zsh,
  }
}

local docker_sources = {
  name = "Docker_Sources",
  filetypes = { "dockerfile" },
  sources = {
    diagnostics.hadolint,
  },
}

local markdown_sources = {
  name = "Markdown_Sources",
  filetypes = { "markdown" },
  sources = {
    formatting.markdownlint,
    diagnostics.alex,
    diagnostics.markdownlint,
    diagnostics.mdl,
  },
}

local lua_sources = {
  name = "Lua_Sources",
  filetypes = { "lua" },
  sources = {
    formatting.lua_format,
    diagnostics.luacheck,
  },
}

local yaml_sources = {
  name = "Yaml_Sources",
  filetypes = { "yaml" },
  sources = {
    formatting.yamlfix,
    formatting.yamlfmt,
    diagnostics.actionlintl,
    diagnostics.yamllint,
  },
}


local git_sources = {
  name = "Git_Sources",
  filetypes = { "gitrebase", "gitcommit" },
  sources = {
    code_actions.gitrebase,
    diagnostics.gitlint,
  },
}


local general_sources = {
  name = "General_Sources",
  filetypes = {},
  sources = {
    completion.spell,
    diagnostics.codespell,
    diagnostics.misspell,
    diagnostics.typos,
  },
}

local other_sources = {
  name = "Other_Sources",
  filetypes = { "json", "yaml", "markdown", "toml" },
  sources = {
    formatting.prettier.with({
      filetypes = { "json", "yaml", "markdown" },
      extra_filetypes = { "toml" },
    }),
    diagnostics.jsonlint,
  },
}

null_ls.register(
  py_sources,
  hs_sources,
  sh_sources,
  docker_sources,
  markdown_sources,
  lua_sources,
  yaml_sources,
  git_sources,
  general_sources,
  other_sources
)
