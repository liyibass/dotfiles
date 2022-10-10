-- Lint
-- load required null-ls references
local h = require("null-ls.helpers")
local cmd_resolver = require("null-ls.helpers.command_resolver")
local methods = require("null-ls.methods")
local u = require("null-ls.utils")
local FORMATTING = methods.internal.FORMATTING

-- Define the new javascript formatter
local pe = h.make_builtin({
  name = "prettier_eslint",
  meta = {
    url = "https://github.com/prettier/prettier-eslint-cli",
    description = "Eslint + Prettier",
  },
  method = FORMATTING,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "jsx"
  },
  factory = h.formatter_factory,
  generator_opts = {
    command = "prettier-eslint",
    args = { "--stdin", "--parser", "babel", "--resolve-plugins-relative-to", "~/.nvm/versions/node/v16.16.0/lib" },
    to_stdin = true,
  },
})

-- optional: Define a second formatter for JSON
local pejson = h.make_builtin({
  name = "prettier_eslint_json",
  meta = {
    url = "https://github.com/prettier/prettier-eslint-cli",
    description = "Eslint + Prettier",
  },
  method = FORMATTING,
  filetypes = {
    "json",
    "cjson",
  },
  factory = h.formatter_factory,
  generator_opts = {
    command = "prettier-eslint",
    args = { "--stdin", "--parser", "json" },
    to_stdin = true,
  },
})

-- Enable the the defined formatters
-- if you are using vanilla NeoVim + null-ls please
-- read how to install/enable on
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/CONFIG.md
local nls = require("null-ls")
nls.setup {
  on_attach = require("lvim.lsp").common_on_attach,
  sources = {
    pe,
    pejson
  }
}

-- optional: LunarVim related step. Here we enable eslint as linter for Javascript.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint",
    filetypes = { "javascript" }
  }
}
