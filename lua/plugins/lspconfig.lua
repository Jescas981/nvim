local lspconfig = require("lspconfig")
local util = require("lspconfig.util")
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

local on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = { "html", "cssls", "tsserver", "clangd", "omnisharp" },
	automatic_installation = true,
})

require("mason-lspconfig").setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			on_attach = on_attach,
			capabilities = {
				offsetEncoding = "utf-8",
			},
		})
	end,
	-- Lua
	["sumneko_lua"] = function()
		lspconfig.sumneko_lua.setup({
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,
	-- Omnisharp
	["omnisharp"] = function()
		lspconfig.omnisharp.setup({})
	end,
})
