local wk = require("which-key")

wk.setup({})

local opts = {
  mode = "n",
  prefix = "<leader>",
  silent = true,
  noremap = true,
}

local mappings = {
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
    f = { ":lua vim.lsp.buf.format { async = true }<CR>", "Format file" },
    g = { ":lua vim.lsp.buf.definition()<CR>", "Go to definition" },
    G = { ":lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    j = {
      vim.diagnostic.goto_next,
      "Next Diagnostic",
    },
    k = {
      vim.diagnostic.goto_prev,
      "Prev Diagnostic",
    },
    l = { vim.lsp.codelens.run, "CodeLens Action" },
    q = { vim.diagnostic.setloclist, "Quickfix" },
    r = { vim.lsp.buf.rename, "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  },
  b = {
    name = "Buffers",
    b = { "<cmd>BufferLineCyclePrev<CR>", "Previous" },
    j = { "<cmd>BufferLinePick<CR>", "Jump" },
    f = { "<cmd>Telescope buffers previewer=false<CR>", "Find" },
    n = { "<cmd>BufferLineCycleNext<CR>", "Next" },
    c = { "<cmd>bd<CR>", "Close" },
    e = {
      "<cmd>BufferLinePickClose<cr>",
      "Pick which buffer to close",
    },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = {
      "<cmd>BufferLineCloseRight<cr>",
      "Close all to the right",
    },
    D = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "Sort by directory",
    },
    L = {
      "<cmd>BufferLineSortByExtension<cr>",
      "Sort by language",
    },
  },
  s = {
    name = "Search",
    f = { "<cmd>Telescope find_files theme=dropdown<CR>", "Find files" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    e = { "<cmd>NvimTreeToggle<CR>", "Toggle NvimTree" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    p = {
      "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
      "Colorscheme with Preview",
    },
  },
  d = {
    name = "Debug",
    c = { "<cmd>DapContinue<CR>", "Continue" },
    U = { "<cmd>require('dapui').toggle()<CR>", "Toggle UI" },
    i = { "<cmd>DapStepInto<CR>", "Step Into" },
    o = { "<cmd>DapStepOver<CR>", "Step Over" },
    u = { "<cmd>DapStepOut<CR>", "Step Out" },
    t = { "<cmd>DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
    d = { "<cmd>DapTerminate", "Terminate session" },
  },
  g = {
    name = "Git",
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<cr>",
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Git Diff",
    },
  },
}

wk.register(mappings, opts)
