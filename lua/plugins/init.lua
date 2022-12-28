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
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"folke/neodev.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"SmiteshP/nvim-navic",
		},
		config = [[require('plugins.lspconfig')]],
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
		},
		config = [[require('plugins.cmp')]],
	})

	-- Syntax highlighting
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = [[require('plugins.treesitter')]] })
	use({
		"numToStr/Comment.nvim",
		requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = [[require('plugins.comment')]],
	})
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
