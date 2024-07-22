-- Drop-in replacement for typdscript-language-server
-- Much more suitable for bigger projects
--
-- return {}
return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    separate_diagnostic_server = true,
    publish_diagnostic_on = 'insert_leave',
    tsserver_max_memory = 'auto',
    jsx_close_tag = {
      enabled = true,
      filetypes = { 'javascriptreact', 'typescriptreact' },
    },
  },
}
