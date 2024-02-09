-- local cmd = vim.cmd
--
-- cmd("set number")         -- set line number
-- cmd("set relativenumber") -- set relative line number
-- cmd("set autoindent")
-- cmd("set tabstop=4")
-- cmd("set shiftwidth=4")
-- cmd("set smarttab")
-- cmd("set softtabstop=4")
-- cmd("set mouse=a")        -- allow mouse action
-- cmd("set mousemoveevent") -- set mouse move detection for bufferline hover show close icon
vim.g.mapleader = " "     -- set space as leader key

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.autoindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.softtabstop = 4
opt.mouse="a"
opt.mousemoveevent = true
