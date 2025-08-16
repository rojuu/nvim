return {
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        multiwindow = false, -- Enable multiwindow support.
        max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to show for a single context
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'topline', -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'c',
          'diff',
          'html',
          'lua',
          'luadoc',
          'markdown',
          'markdown_inline',
          'query',
          'vim',
          'vimdoc',
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'ruby' },
        },
        indent = { enable = true, disable = { 'ruby' } },
      }

      local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

      -- Firestore rules
      parser_config.rules = {
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
    end,
  },
}
