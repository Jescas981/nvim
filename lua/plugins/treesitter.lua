require("nvim-autopairs").setup({})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "cpp", "lua", "html", "typescript", "javascript" },
	context_commentstring = {
		config = {},
		enable = true,
	},
	highlight = {
		enable = true,
		module_path = "nvim-treesitter.highlight",
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = false,
		extended_mode = true,
		max_file_lines = nil,
	},
})
