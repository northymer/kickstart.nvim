return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  lazy = false,
  init = function()
    -- Disable netrw to prevent it from showing
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Auto-open neo-tree on startup
    vim.api.nvim_create_autocmd('VimEnter', {
      group = vim.api.nvim_create_augroup('Neotree_auto_open', { clear = true }),
      desc = 'Auto-open Neo-tree on startup',
      callback = function()
        -- Only open if no file was specified as argument
        if vim.fn.argc() == 0 then
          require('neo-tree.command').execute { source = 'filesystem', toggle = true }
        end
      end,
    })

    -- Handle directory arguments
    vim.api.nvim_create_autocmd('BufEnter', {
      group = vim.api.nvim_create_augroup('Neotree_start_directory', { clear = true }),
      desc = 'Start Neo-tree with directory',
      once = true,
      callback = function()
        if package.loaded['neo-tree'] then
          return
        else
          local stats = vim.uv.fs_stat(vim.fn.argv(0))
          if stats and stats.type == 'directory' then
            require('neo-tree.command').execute { source = 'filesystem', dir = vim.fn.argv(0) }
          end
        end
      end,
    })
  end,
  opts = {
    sources = { 'filesystem', 'buffers', 'git_status' },
    open_files_do_not_replace_types = { 'terminal', 'Trouble', 'trouble', 'qf', 'Outline' },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false,
        hide_by_name = {
          '.DS_Store',
          'thumbs.db',
        },
        hide_by_pattern = {
          '*.meta',
          '*/src/*/tsconfig.json',
        },
        always_show = {
          '.gitignored',
        },
        never_show = {
          '.DS_Store',
          'thumbs.db',
        },
        never_show_by_pattern = {
          '.null-ls_*',
          '*.min.js',
        },
      },
    },
    window = {
      mappings = {
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['<space>'] = 'none',
        ['Y'] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg('+', path, 'c')
          end,
          desc = 'Copy Path to Clipboard',
        },
        ['O'] = {
          function(state)
            require('lazy.util').open(state.tree:get_node().path, { system = true })
          end,
          desc = 'Open with System Application',
        },
        ['P'] = { 'toggle_preview', config = { use_float = false } },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = ' ',
        expander_expanded = ' ',
        expander_highlight = 'NeoTreeExpander',
      },
      git_status = {
        symbols = {
          unstaged = '󰄱',
          staged = '󰱒',
        },
      },
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)

    -- Refresh git status after lazygit closes
    vim.api.nvim_create_autocmd('TermClose', {
      pattern = '*lazygit',
      callback = function()
        if package.loaded['neo-tree.sources.git_status'] then
          require('neo-tree.sources.git_status').refresh()
        end
      end,
    })
  end,
}
