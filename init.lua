vim.loader.enable()

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
vim.keymap.set('n', '<leader>dp', goto_prev_diagnostic, { desc = 'Go [D]iagnostic [P]prev' })

vim.keymap.set('n', '<C-Right>', '<C-w>>', { desc = 'Increase width of window' })
vim.keymap.set('n', '<C-Left>', '<C-w><', { desc = 'Decrease width of window' })
vim.keymap.set('n', '<C-Up>', '<C-w>+', { desc = 'Increase height of window' })
vim.keymap.set('n', '<C-Down>', '<C-w>-', { desc = 'Decrease height of window' })

vim.keymap.set('n', '<leader>y', '"*y', { desc = 'Yank to system clipboard' })
vim.keymap.set('v', '<leader>y', '"*y', { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>p', '"*p', { desc = 'Paste from system clipboard' })
vim.keymap.set('v', '<leader>p', '"*p', { desc = 'Paste from system clipboard' })

vim.keymap.set('n', '<leader>Yr', function()
  vim.fn.setreg('*', vim.fn.expand '%')
end, { desc = 'Yank relative file name to system clipboard' })
vim.keymap.set('n', '<leader>Yf', function()
  vim.fn.setreg('*', vim.fn.expand '%:p')
end, { desc = 'Yank full file name to system clipboard' })
vim.keymap.set('n', '<leader>Yp', function()
  vim.fn.setreg('*', vim.fn.expand '%:p:h')
end, { desc = 'Yank full path of current file to system clipboard' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FocusGained', {
  desc = 'Update file when there are changes',
  group = vim.api.nvim_create_augroup('roju-focus-checktime', { clear = true }),
  callback = function()
    vim.cmd 'checktime'
  end,
})

---Helper for github repos
---@param repo string
---@return string
local function gh(repo)
  return 'https://github.com/' .. repo
end

vim.pack.add {
  { name = 'catppuccin', src = gh 'catppuccin/nvim' },
  gh 'nvim-lua/plenary.nvim',
  gh 'NMAC427/guess-indent.nvim',
  gh 'nvim-tree/nvim-web-devicons',
  gh 'nvim-lualine/lualine.nvim',
  gh 'folke/todo-comments.nvim',
  gh 'echasnovski/mini.nvim',
  gh 'echasnovski/mini.icons',
  gh 'kylechui/nvim-surround',
  gh 'tpope/vim-fugitive',
  gh 'sindrets/diffview.nvim',
  gh 'lewis6991/gitsigns.nvim',
  gh 'stevearc/oil.nvim',
  gh 'folke/which-key.nvim',
  -- TODO: Need to run 'make' somehow? Or swap to dmtrKovalenko/fff?
  { src = gh 'nvim-telescope/telescope-fzf-native.nvim', version = 'b25b749b9db64d375d782094e2b9dce53ad53a40' },
  { src = gh 'nvim-telescope/telescope-ui-select.nvim', version = '6e51d7da30bd139a6950adf2a47fda6df9fa06d2' },
  { src = gh 'nvim-telescope/telescope.nvim', version = '427b576c16792edad01a92b89721d923c19ad60f' },
  gh 'stevearc/conform.nvim',
  gh 'L3MON4D3/LuaSnip',
  gh 'folke/lazydev.nvim',
  { src = gh 'saghen/blink.cmp', version = '78336bc89ee5365633bcf754d93df01678b5c08f' }, 
  gh 'nvim-treesitter/nvim-treesitter',
}

---
--- THEME
---
require('catppuccin').setup { flavor = 'mocha' }
vim.cmd 'colorscheme catppuccin'

---
--- GUESS INDENT
---
require('guess-indent').setup {
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
}

---
--- STATUSLINE
---
require('lualine').setup {
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
}

---
--- TODO COMMENTS
---
require('todo-comments').setup {
  signs = false,
}

---
--- MINI
---
require('mini.ai').setup { n_lines = 500 }
require('mini.surround').setup()
local statusline = require 'mini.statusline'
statusline.setup { use_icons = vim.g.have_nerd_font }
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function()
  return '%2l:%-2v'
end

---
--- DIFF VIEW
---
require('diffview').setup {}

---
--- GIT SIGNS
---
do
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
  vim.keymap.set('n', '<leader>bb', gitsigns.blame, { desc = 'Git [B]lame Buffer' })
  vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Git [H]unk [P]review}' })
  vim.keymap.set('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Git [H]unk [I]inline Preview}' })
end

---
--- OIL NVIM
---
require('oil').setup()
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

---
--- WHICH KEY
---
require('which-key').setup {
  delay = 500,
  icons = {
    mappings = vim.g.have_nerd_font,
    keys = vim.g.have_nerd_font and {} or {
      Up = '<Up> ',
      Down = '<Down> ',
      Left = '<Left> ',
      Right = '<Right> ',
      C = '<C-…> ',
      M = '<M-…> ',
      D = '<D-…> ',
      S = '<S-…> ',
      CR = '<CR> ',
      Esc = '<Esc> ',
      ScrollWheelDown = '<ScrollWheelDown> ',
      ScrollWheelUp = '<ScrollWheelUp> ',
      NL = '<NL> ',
      BS = '<BS> ',
      Space = '<Space> ',
      Tab = '<Tab> ',
      F1 = '<F1>',
      F2 = '<F2>',
      F3 = '<F3>',
      F4 = '<F4>',
      F5 = '<F5>',
      F6 = '<F6>',
      F7 = '<F7>',
      F8 = '<F8>',
      F9 = '<F9>',
      F10 = '<F10>',
      F11 = '<F11>',
      F12 = '<F12>',
    },
  },
  spec = {
    { '<leader>f', group = '[F]ind' },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
  },
}

---
--- TELESCOPE
---
do
  require('telescope').setup {
    extensions = {
      ['ui-select'] = {
        require('telescope.themes').get_dropdown(),
      },
    },
  }

  pcall(require('telescope').load_extension, 'fzf')
  pcall(require('telescope').load_extension, 'ui-select')

  local builtin = require 'telescope.builtin'
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
  vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
  vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' })
  vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
  vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
  vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
  vim.keymap.set('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
  vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind existing [B]uffers' })

  vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })

  vim.keymap.set('n', '<leader>f/', function()
    builtin.live_grep {
      grep_open_files = true,
      prompt_title = 'Live Grep in Open Files',
    }
  end, { desc = '[F]ind [/] in Open Files' })

  vim.keymap.set('n', '<leader>fn', function()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
  end, { desc = '[F]ind [N]eovim files' })
end

---
--- TREESITTER
---
do
  local parsers = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }
  require('nvim-treesitter').install(parsers)

  ---@param buf integer
  ---@param language string
  local function treesitter_try_attach(buf, language)
    -- Check if a parser exists and load it
    if not vim.treesitter.language.add(language) then return end
    -- Enable syntax highlighting and other treesitter features
    vim.treesitter.start(buf, language)

    -- Enable treesitter based folds
    -- For more info on folds see `:help folds`
    -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    -- vim.wo.foldmethod = 'expr'

    -- Check if treesitter indentation is available for this language, and if so enable it
    -- in case there is no indent query, the indentexpr will fallback to the vim's built in one
    local has_indent_query = vim.treesitter.query.get(language, 'indents') ~= nil

    -- Enable treesitter based indentation
    if has_indent_query then vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end
  end

  local available_parsers = require('nvim-treesitter').get_available()
  vim.api.nvim_create_autocmd('FileType', {
    callback = function(args)
      local buf, filetype = args.buf, args.match

      local language = vim.treesitter.language.get_lang(filetype)
      if not language then return end

      local installed_parsers = require('nvim-treesitter').get_installed 'parsers'

      if vim.tbl_contains(installed_parsers, language) then
        -- Enable the parser if it is already installed
        treesitter_try_attach(buf, language)
      elseif vim.tbl_contains(available_parsers, language) then
        -- If a parser is available in `nvim-treesitter`, auto-install it and enable it after the installation is done
        require('nvim-treesitter').install(language):await(function() treesitter_try_attach(buf, language) end)
      else
        -- Try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
        treesitter_try_attach(buf, language)
      end
    end,
  })

  local parsers = require('nvim-treesitter.parsers')

  -- Firestore rules
  parsers.rules = {
    install_info = {
      url = 'https://github.com/rojuu/tree-sitter-firebase-rules',
      revision = '038f798fc68314696c59c571bcc022546c3bf790',
      branch = 'main',
      files = { 'src/parser.c' },
      generate_requires_npm = false, -- if stand-alone parser without npm dependencies
      requires_generate_from_grammar = true, -- could regenaret in the repo, but too lazy to do that. At least the grammar file works fine
    },
    filetype = 'rules', -- if filetype does not match the parser name
  }
  -- TODO: Port this to lua when I'm not lazy
  -- For .rules files the ft was detected as "hog" for some reason
  vim.cmd [[au BufRead,BufNewFile *.rules set filetype=rules]]
end

---
--- FORMATTING
---
do
  require('conform').setup {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    },
  }

  vim.keymap.set('n', '<leader>F', function()
    require('conform').format { async = true, lsp_format = 'fallback' }
  end, { desc = '[F]ormat buffer' })
end

---
--- AUTOCOMPLETE
---
do
  require('blink-cmp').setup {
    keymap = {
      ['<C-e>'] = { 'hide', 'fallback' },
      ['<CR>'] = { 'accept', 'fallback' },

      ['<Tab>'] = { 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
      ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

      ['<C-x>'] = { 'show', 'fallback_to_mappings' },

      ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

      ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },

    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      menu = {
        draw = {
          columns = {
            { 'kind_icon', 'label', 'label_description', 'source_name', gap = 1 },
          },
          components = {
            label_description = {
              width = { max = 50 },
            },
            source_name = {
              text = function(ctx)
                return '[' .. ctx.source_name .. ']'
              end,
            },
          },
        },
      },
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },

    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'lua' },
    signature = { enabled = true },
  }
end
