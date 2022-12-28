local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local null_ls = require("null-ls")
local dap = require("dap")
local dapui = require('dapui')

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

require('nvim-navic').setup {
  highlight = true
}

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

require("mason").setup({})

-- LSP Related

require("mason-lspconfig").setup({
  ensure_installed = { "html", "cssls", "tsserver", "clangd", "omnisharp", "cmake", "sumneko_lua", "jsonls" },
})

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

-- Debug Adapter Related

dapui.setup()

require("mason-nvim-dap").setup({
  ensure_installed = { "cpptools" },
  automatic_setup = true,
})

require("mason-nvim-dap").setup_handlers({
  function(source_name)
    -- all sources with no handler get passed here
    -- Keep original functionality of `automatic_setup = true`
    require("mason-nvim-dap.automatic_setup")(source_name)
  end,
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Format and linter Related

require("mason-null-ls").setup({
  ensure_installed = { "stylua", "clang-format", "prettier", "csharpier" },
  automatic_setup = true,
})

require("mason-null-ls").setup_handlers({
  function(source_name, methods)
    -- all sources with no handler get passed here

    -- To keep the original functionality of `automatic_setup = true`,
    -- please add the below.
    require("mason-null-ls.automatic_setup")(source_name, methods)
  end,
  ["stylua"] = function(source_name, methods)
    null_ls.register(null_ls.builtins.formatting.stylua)
  end,
})

-- will setup any installed and configured sources above
null_ls.setup()
