local lspconfig = require("lspconfig")
local navic = require("nvim-navic")

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "cmake", "html", "cssls", "clangd", "tsserver" }
}

require("mason-null-ls").setup({
    ensure_installed = { "stylua", "ltrs", "clang_format" }
})

local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

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
    ["lua_ls"] = function()
        lspconfig.lua_ls.setup({
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
    ["jsonls"] = function()
        lspconfig.jsonls.setup({
            capabilities = capabilities,
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
        })
    end,
})
