local plugin_list = {
  ['folke/lazy.nvim'] = {
    version = '*',
  },

  ['ellisonleao/gruvbox.nvim'] = {},

  ['catppuccin/nvim'] = {
    name = 'catppuccin',
    flavour = 'mocha',
  },

  ['kyazdani42/nvim-web-devicons'] = {},

  ['nvim-lua/plenary.nvim'] = {},

  ['folke/which-key.nvim'] = {
    config = function()
      require('which-key').setup()
    end
  },

  -- ['nvim-lualine/lualine.nvim'] = {
  --   config = function()
  --     require('plugins.config.lualine')
  --   end
  -- },

  ['nvim-neo-tree/neo-tree.nvim'] = {
    branch = 'v2.x',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    config = function()
        require('plugins.config.neo-tree')
      end
  },

  ['goolord/alpha-nvim'] = {
    config = function ()
      require('plugins.config.alpha')
    end
  },

  ['windwp/nvim-autopairs'] = {
    config = function()
      require('nvim-autopairs').setup()
    end
  },

  ['numToStr/Comment.nvim'] = {
    config = function()
      require('Comment').setup()
    end
  },

  ['mrjones2014/smart-splits.nvim'] = {
    config = function()
      require('plugins.config.smart_splits')
    end,
  },

  ['lukas-reineke/indent-blankline.nvim'] = {
    version = '^3.0.0',
    main = 'ibl',
    config = function()
      require('plugins.config.indent_blankline')
    end
  },

  ['akinsho/toggleterm.nvim'] = {
    config = function()
      require('plugins.config.toggleterm')
    end
  },

  ['lewis6991/gitsigns.nvim'] = {
    config = function()
      require('gitsigns').setup()
    end
  },

  ['nvim-treesitter/nvim-treesitter'] = {
    config = function()
      require('plugins.config.treesitter')
    end
  },

  ['nvim-telescope/telescope.nvim'] = {
    dependencies = { 
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    }
  },

  ['stevearc/aerial.nvim'] = {
    config = function()
      require('plugins.config.aerial')
    end
  },

  ['ray-x/lsp_signature.nvim'] = {
    config = function()
      require('lsp_signature').setup()
    end
  },

  ['onsails/lspkind-nvim'] = {},

  ['folke/trouble.nvim'] = {
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup()
    end,
  },

  ['j-hui/fidget.nvim'] = {
    config = function()
      require('fidget').setup()
    end
  },

  ['kylechui/nvim-surround'] = {
    config = function()
        require('nvim-surround').setup()
    end
  },

  ['RRethy/vim-illuminate'] = {
    config = function()
      require('plugins.config.illuminate')
    end
  },

  ['SmiteshP/nvim-navic'] = {
    dependencies = 'neovim/nvim-lspconfig',
    config = function()
      require('plugins.config.breadcrumbs')
    end
  },

  ['hrsh7th/nvim-cmp'] = {
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require('plugins.config.cmp')
      require('luasnip.loaders.from_vscode').lazy_load()
    end
  },

  ['williamboman/mason.nvim'] = {
    config = function()
      require('plugins.config.mason')
    end
  },

  ['neovim/nvim-lspconfig'] = {
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup()
      require('plugins.config.lsp')
    end
  },

  ['zbirenbaum/copilot.lua'] = {
    config = function()
      require('copilot').setup()
    end,
  },

  ['yetone/avante.nvim'] = {
    event = 'VeryLazy',
    lazy = true,
    version = false,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'zbirenbaum/copilot.lua',
    },
    config = function()
      require('plugins.config.avante')
    end,
  },
}

return plugin_list
