-- Drop-in replacement for typdscript-language-server
-- Much more suitable for bigger projects
--
-- return {}
return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    tsserver_max_memory = 'auto',
  },
}
