vim.g.mapleader = " " -- set space as leader key

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
opt.clipboard = "unnamed,unnamedplus"
opt.cursorline = true
opt.signcolumn = "yes"

-- set fold stuffs for plugin nvim-ufo
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- set conceallevel for markdown
opt.conceallevel = 2
