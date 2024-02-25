vim.g.mapleader = " " -- set space as leader key

vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns =
	{ "class", "function", "method", "^if", "^while", "^for", "^object", "^table", "block", "arguments" }

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.softtabstop = 4
opt.mouse = "a"
opt.mousemoveevent = true
opt.ignorecase = true
opt.termguicolors = true
