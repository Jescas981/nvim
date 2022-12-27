require("mason").setup({})

require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "clangd", "cssls", "html", "tsserver" },
})
