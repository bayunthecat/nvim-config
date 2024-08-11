local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt", "golines", "goimports-reviser" },
    c = { "clang-format" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
