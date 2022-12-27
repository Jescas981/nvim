require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "cpp", "lua", "html", "typescript", "javascript" },
  modules = {
    auto_install = true,
    autopairs = {
      enable = true,
    },
  },
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
