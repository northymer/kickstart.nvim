return {
  'nvimtools/none-ls.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.eslint_d,
      },
    }
  end,
}
