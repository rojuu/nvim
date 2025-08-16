return {
  'tpope/vim-fugitive',

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      local gitsigns = require 'gitsigns'
      gitsigns.setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }

      local next_hunk = function()
        gitsigns.nav_hunk 'next'
      end
      local prev_hunk = function()
        gitsigns.nav_hunk 'prev'
      end
      vim.keymap.set('n', ']g', next_hunk, { desc = 'Goto next git hunk' })
      vim.keymap.set('n', '[g', prev_hunk, { desc = 'Goto prevgit hunk' })

      vim.keymap.set('n', '<leader>bl', gitsigns.blame_line, { desc = 'Git [B]lame [L]line}' })
      vim.keymap.set('n', '<leader>bb', gitsigns.blame, { desc = 'Git [B]lame [L]line}' })

      vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git [H]unk [P]review}' })
      vim.keymap.set('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Git [H]unk [I]inline Preview}' })
    end,
  },
}
