-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'rolv-apneseth/tfm.nvim',
    config = function()
      -- Set keymap so you can open the default terminal file manager (yazi)
      vim.api.nvim_set_keymap('n', '<leader>e', '', {
        noremap = true,
        callback = require('tfm').open,
      })
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gl', '<cmd>LazyGit<cr>', desc = '[L]azyGit' },
    },
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup()

      vim.keymap.set('n', '<leader>a\\', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Show quick menu' })
      vim.keymap.set('n', '<leader>aa', function()
        harpoon:list():add()
      end, { desc = '[A]dd file' })
      vim.keymap.set('n', '<leader>an', function()
        harpoon:list():select(1)
      end, { desc = 'Go To #1' })
      vim.keymap.set('n', '<leader>am', function()
        harpoon:list():select(2)
      end, { desc = 'Go To #2' })
      vim.keymap.set('n', '<leader>a,', function()
        harpoon:list():select(3)
      end, { desc = 'Go To #3' })
      vim.keymap.set('n', '<leader>a.', function()
        harpoon:list():select(4)
      end, { desc = 'Go To #4' })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-U>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-I>', function()
        harpoon:list():next()
      end)
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'rmagatti/auto-session',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('auto-session').setup {
        log_level = 'error',
        auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },

        -- The following are already the default values, no need to provide them if these are already the settings you want.
        session_lens = {
          -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
          load_on_setup = true,
          theme_conf = { border = true },
          previewer = false,
          buftypes_to_ignore = {}, -- list of buffer types that should not be deleted from current session when a new one is loaded
        },
      }
      vim.keymap.set('n', '<leader>s', require('auto-session.session-lens').search_session, {
        noremap = true,
      })
    end,
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
      }
    end,
  },
  {
    'mg979/vim-visual-multi',
  },
  {
    'hedyhli/outline.nvim',
    lazy = true,
    cmd = { 'Outline', 'OutlineOpen' },
    keys = { -- Example mapping to toggle outline
      { '<leader>o', '<cmd>Outline<CR>', desc = 'Toggle outline' },
    },
    opts = {
      -- Your setup opts here
    },
    config = function()
      require('outline').setup {}
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    init = function()
      vim.cmd.colorscheme 'nordfox'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      -- vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
    },
    config = function()
      require('ufo').setup()
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        enable = true,
      }
    end,
  },
}
