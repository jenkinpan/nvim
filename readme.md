# neovim config profile

use lazy.vim to manage neovim config

## file tree

|-- init.lua<br>
|-- lua<br>
|--|-- plugins<br>
|--|-- vim-options.lua<br>
`---------------------

## Install

telescope.nvim<br>
neo-tree<br>
tree-sitter<br>
nvim-lspconfig<br>
mason<br>
lsp<br>
formatter<br>

## Key binding

### Neo-Tree short key

- Ctrl + n to open Neo-Tree
- Ctrl + g to open Neo-Tree git_status floating window

### window jumping short key

- Ctrl + h to jump to the left split window
- Ctrl + l to jump to the right split window
- Ctrl + j to jump to the bottom split window
- Ctrl + k to jump to the upper split window

### Noice.Nvim

- request treesitter with(vim, regex, lua, bash, markdown, markdown_inline)

#### key bind
**&lt;leader&gt;ds** to dimiss all visible messages
