local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
    },
    config = function()
      require('plugins.mason')
    end
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("plugins.null-ls")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-autopairs",
      "windwp/nvim-ts-autotag",
      "p00f/nvim-ts-rainbow"
    },
    config = function()
      require("plugins.nvim-treesitter")
    end,

  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('plugins.nvim-tree')
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    build = "make install_jsregexp",
    config = function()
      require('plugins.cmp')
    end
  },
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require("plugins.project")
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("plugins.lua-line")
    end,
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require('plugins.alpha')
    end
  },
  { 'b0o/SchemaStore.nvim' },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function()
      require('plugins.which-key')
    end
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require('plugins.toggleterm')
    end
  },
  {

    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.gitsigns')
    end
  },
  {
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require('plugins.bufferline')
    end
  },
  { "lukas-reineke/indent-blankline.nvim" },
  {
    "sainnhe/edge",
    config = function()
      require('plugins.colorscheme')
    end
  }
}
