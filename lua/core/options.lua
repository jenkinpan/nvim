vim.g.mapleader = " " -- set space as leader key

vim.g.codeium_disable_bindings = 1	-- disable default bindings for codeium

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.splitbelow = true -- split below instead of above
opt.splitright = true

vim.opt.wrap = false

opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.softtabstop = 4
opt.mouse = "a"
opt.mousemoveevent = true
opt.ignorecase = true
opt.termguicolors = true
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.virtualedit = "block"
-- opt.scrolloff = 999
opt.signcolumn = "yes"

-- set fold stuffs for plugin nvim-ufo
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- set conceallevel for markdown obsidian
opt.conceallevel = 2
