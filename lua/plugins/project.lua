require("project_nvim").setup({
  manual_mode = false,
  detection_methods = { "pattern" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "compile_commands.json" },
  exclude_dirs = { "node_modules" },
  show_hidden = false,
})

require('telescope').load_extension('projects')
