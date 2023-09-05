-- Check if 'termguicolors' is set
if vim.fn.has('termguicolors') == 1 then
    vim.opt.termguicolors = true -- Set termguicolors
end

-- Set global variables
vim.g.edge_style = 'aura'
vim.g.edge_better_performance = 1

-- Set colorscheme
vim.cmd('colorscheme edge')

-- Configure Lightline colorscheme
vim.g.lightline = { colorscheme = 'edge' }