return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require('supermaven-nvim').setup {
      keymaps = {
        accept_suggestion = '<C-j>',
        clear_suggestion = '<C-]>',
      },
      disable_inline_completion = false,
      disable_keymaps = false,
      log_level = 'info',
      condition = function()
        local filetype = vim.bo.filetype
        local ignore_filetypes = { 'gitcommit', 'markdown', 'help' }
        return vim.tbl_contains(ignore_filetypes, filetype)
      end,
    }
  end,
}
