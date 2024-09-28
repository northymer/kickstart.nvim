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
      timeout_ms = 1500,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      typescript = { 'prettierd', 'eslint_d' },
      typescriptreact = { 'prettierd', 'eslint_d' },
      javascript = { 'prettierd', 'eslint_d' },
      javascriptreact = { 'prettierd', 'eslint_d' },
      css = { 'stylelint' },
    },
  },
}
