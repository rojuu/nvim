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
    opts = {
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },

  {
    'ramojus/mellifluous.nvim',
    name = 'mellifluous',
    config = function()
      require('mellifluous').setup {
        main_keywords = { bold = false },
      }
      vim.cmd 'colorscheme mellifluous'
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
