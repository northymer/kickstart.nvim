return { -- Autoformat
  'stevearc/conform.nvim',
  opts = {
    formatters = {
      prettierd = {
        env = {
          PRETTIERD_LOCAL_PRETTIER_ONLY = 'true',
        },
      },
    },
    notify_on_error = false,
    format_on_save = {
      lsp_format = 'fallback',
      timeout_ms = 500,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      typescript = { 'eslint', 'prettierd' },
      typescriptreact = { 'eslint', 'prettierd' },
      javascript = { 'eslint', 'prettierd' },
      javascriptreact = { 'eslint', 'prettierd' },
      css = { 'stylelint' },
    },
  },
}
