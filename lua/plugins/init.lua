local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
  -- Package manager
  use("wbthomason/packer.nvim")
  -- LSP
  use({ "neovim/nvim-lspconfig", requires = { "folke/neodev.nvim" }, config = [[require('plugins.lspconfig')]] })
  use({
    "williamboman/mason.nvim",
    requires = { "williamboman/mason-lspconfig.nvim" },
    config = [[require('plugins.mason')]],
  })
  use({
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  })
  -- Autocompletion
  use("onsails/lspkind.nvim")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use({ "hrsh7th/nvim-cmp", config = [[require('plugins.cmp')]] })
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  -- Syntax highlighting
  use({ "nvim-treesitter/nvim-treesitter", run = [[vim.cmd('TSUpdate')]], config = [[require('plugins.treesitter')]] })
  use({ "JoosepAlviste/nvim-ts-context-commentstring" })
  use({ "windwp/nvim-autopairs", config = [[require('plugins.autopairs')]] })
  -- Linter and formatter
  use({ "jose-elias-alvarez/null-ls.nvim", config = [[require('plugins.null-ls')]] })
  -- File searcher
  use({ "ahmedkhalf/project.nvim", config = [[require('plugins.project')]] })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = { "nvim-lua/plenary.nvim" },
  })
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    config = [[require('plugins.nvim-tree')]],
  })
  -- Debugger
  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" }, config = [[require('plugins.dap')]] })
  -- Extras
  use({
    "goolord/alpha-nvim",
    config = [[require('plugins.alpha')]],
  })
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  })
  use({
    "folke/which-key.nvim",
    config = [[require('plugins.which-key')]],
  })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = [[require('plugins.lualine')]],
  })
  use({
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = "nvim-tree/nvim-web-devicons",
    config = [[require('plugins.bufferline')]],
  })
  use({ "akinsho/toggleterm.nvim", tag = "*", config = [[require('plugins.toggleterm')]] })
  use({ "lukas-reineke/indent-blankline.nvim" })
  use("nvim-lua/popup.nvim")
  use({ "RRethy/vim-illuminate", config = [[require('illuminate').configure()]] })
  -- Colorschemes
  use({ "EdenEast/nightfox.nvim", config = [[vim.cmd('colorscheme nightfox')]] })
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
