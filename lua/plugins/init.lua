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
	-- LSP & Linter & formatter
	use({
		"williamboman/mason.nvim",
		requires = {
			"folke/neodev.nvim",
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"jay-babu/mason-null-ls.nvim",
			"SmiteshP/nvim-navic",
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap",
		},
		config = [[require('plugins.mason')]],
	})
	-- Autocompletion
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = [[require('plugins.cmp')]],
	})

	-- Syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		requires = { "windwp/nvim-autopairs", "windwp/nvim-ts-autotag", "p00f/nvim-ts-rainbow" },
		config = [[require('plugins.treesitter')]],
	})
	use({
		"numToStr/Comment.nvim",
		requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = [[require('plugins.comment')]],
	})
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
	-- Extras
	use("b0o/schemastore.nvim")
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
	-- use({ "EdenEast/nightfox.nvim", config = [[vim.cmd('colorscheme duskfox')]] })
  use({"folke/tokyonight.nvim",config=[[vim.cmd('colorscheme tokyonight-moon')]]})
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
