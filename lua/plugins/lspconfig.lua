local lspconfig = require("lspconfig")
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- Base related

lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
})

-- Web related

lspconfig.html.setup({})

lspconfig.tsserver.setup({})

lspconfig.cssls.setup({})

-- Projects related

lspconfig.cmake.setup({
	on_attach = on_attach,
})

lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = {
		offsetEncoding = "utf-8",
	},
})
