vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false

vim.o.number = true
vim.o.relativenumber = true

vim.o.mouse = 'a'

vim.o.showmode = false

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = 'yes'

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = false

vim.o.list = true
--vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.listchars = { tab = '  ', trail = '·', nbsp = '␣' }
vim.opt.tabstop = 4

vim.o.inccommand = 'split'

vim.o.cursorline = true

vim.o.scrolloff = 0

vim.o.confirm = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

local goto_next_diagnostic = function()
  vim.diagnostic.jump { count = 1 }
end
local goto_prev_diagnostic = function()
  vim.diagnostic.jump { count = -1 }
end

vim.keymap.set('n', '<leader>qq', ':cclose<CR>', { desc = 'Close [Q]uickfix list' })
vim.keymap.set('n', '<leader>qo', ':copen<CR>', { desc = 'Open [Q]uickfix list' })
vim.keymap.set('n', '<leader>qd', vim.diagnostic.setqflist, { desc = 'Populate [Q]uickfix list with [D]iagnostics' })
vim.keymap.set('n', '<M-n>', ':cnext<CR>', { desc = 'Go to next [Q]uickfix' })
vim.keymap.set('n', '<M-p>', ':cprev<CR>', { desc = 'Go to prev [Q]uickfix' })

vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, { desc = '[D]iagnostic [O]pen in floating window' })
vim.keymap.set('n', '<leader>dn', goto_next_diagnostic, { desc = 'Go [D]iagnostic [N]ext' })
vim.keymap.set('n', '<leader>dn', goto_prev_diagnostic, { desc = 'Go [D]iagnostic [P]prev' })

vim.keymap.set('n', '<leader>y', '"*y', { desc = 'Yank to system clipboard' })
vim.keymap.set('v', '<leader>y', '"*y', { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>p', '"*p', { desc = 'Paste from system clipboard' })
vim.keymap.set('v', '<leader>p', '"*p', { desc = 'Paste from system clipboard' })

vim.keymap.set('n', '<leader>Yr', function()
  vim.fn.setreg('*', vim.fn.expand '%')
end, { desc = 'Yank relative file path to system clipboard' })
vim.keymap.set('n', '<leader>Yf', function()
  vim.fn.setreg('*', vim.fn.expand '%:p')
end, { desc = 'Yank full file path to system clipboard' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  { import = 'custom.plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
