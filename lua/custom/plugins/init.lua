return {
  {
    'NMAC427/guess-indent.nvim',
    opts = {
      auto_cmd = true,
      override_editorconfig = false,
      filetype_exclude = {
        'netrw',
        'tutor',
      },
      buftype_exclude = {
        'help',
        'nofile',
        'terminal',
        'prompt',
      },
      on_tab_options = {
        ['expandtab'] = false,
        ['tabstop'] = 4,
        ['softtabstop'] = 4,
        ['shiftwidth'] = 4,
      },
      on_space_options = {
        ['expandtab'] = true,
        ['tabstop'] = 'detected',
        ['softtabstop'] = 'detected',
        ['shiftwidth'] = 'detected',
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {}
    end,
  },
  {
    'WTFox/jellybeans.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('jellybeans').setup {
        transparent = true,
        italics = true,
      }
      vim.cmd.colorscheme 'jellybeans'
    end,
  },

  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  {
    'kylechui/nvim-surround',
    version = '^3.0.0',
    event = 'VeryLazy',
    opts = {},
  },
}
