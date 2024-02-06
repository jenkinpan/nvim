local cmd = vim.cmd

cmd("set number")         -- set line number
cmd("set relativenumber") -- set relative line number
cmd("set autoindent")
cmd("set tabstop=4")
cmd("set shiftwidth=4")
cmd("set smarttab")
cmd("set softtabstop=4")
cmd("set mouse=a")        -- allow mouse action
cmd("set mousemoveevent") -- set mouse move detection for bufferline hover show close icon
vim.g.mapleader = " "     -- set space as leader key
