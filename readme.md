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
Noice.nvim

## Key binding

- **&lt;leader&gt;n to cancel search result highlight for /
- Ctrl + n to open Neo-Tree
- Ctrl + g to open Neo-Tree git_status floating window
- Ctrl + h to jump to the left split window
- Ctrl + l to jump to the right split window
- Ctrl + j to jump to the bottom split window
- Ctrl + k to jump to the upper split window

### KeyBind for Comment
- NORMAL mode

```help
`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comments


```help
`gco` - Insert comment to the next line and enters INSERT mode
`gcO` - Insert comment to the previous line and enters INSERT mode
`gcA` - Insert comment to end of the current line and enters INSERT mode
```
- VISUAL mode

```help
`gc` - Toggles the region using linewise comment
`gb` - Toggles the region using blockwise comment
```
### Noice.Nvim

- request treesitter with(vim, regex, lua, bash, markdown, markdown_inline)

#### key bind
**&lt;leader&gt;ds** to dimiss all visible messages
