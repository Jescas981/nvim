require('nvim-autopairs').setup({})


require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "cpp", "lua", "html", "typescript", "javascript" },
  context_commentstring = {
    config = {},
    enable = true,
  },
  highlight = {
    enable = true,
    loaded = true,
    module_path = "nvim-treesitter.highlight",
  },
})
