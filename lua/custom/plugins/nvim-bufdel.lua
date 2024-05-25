return {
  'ojroques/nvim-bufdel',
  config = function()
    -- Buffer keybinds
    require('bufdel').setup {
      next = 'tabs',
      quit = false, -- quit Neovim when last buffer is closed
    }
    vim.keymap.set('n', '<leader>bc', ':BufDel<cr>', { desc = '[B]uffer [C]lose' })
    vim.keymap.set('n', '<leader>bC', ':BufDelAll<cr>', { desc = '[B]uffer [C]lose all' })
    vim.keymap.set('n', '<leader>bO', ':BufDelOthers<cr>', { desc = '[B]uffer Close [O]thers' })
  end,
}
