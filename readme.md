# neovim config profile

use Lazy to manage plugins

## file tree

├── init.lua<br>
├── lua<br>
│   ├── core<br>
│   │   ├── keymaps.lua<br>
│   │   └── options.lua<br>
│   └── plugins<br>
│   ├── colorscheme.lua<br>
│   ├── comment.lua<br>
│   ├── compeletions.lua<br>
│   ├── copilot.lua<br>
│   ├── debuggging.lua<br>
│   ├── flash.lua<br>
│   ├── git-stuff.lua<br>
│   ├── lsp-config.lua<br>
│   ├── neo-tree.lua<br>
│   ├── none-ls.lua<br>
│   ├── telecope.lua<br>
│   ├── treesitter.lua<br>
│   └── ui.lua<br>
└── readme.md

## Installed Plugins

telescope.nvim<br>
neo-tree<br>
tree-sitter<br>
nvim-lspconfig<br>
mason<br>
null-ls<br>
noice.nvim<br>
nvim-ufo

## KeyBinding

- NORMAL mode

```help
`<leader>n` - cancel search result highlight
`Ctrl+h` - jump to the left split window
`Ctrl+l` - jump to the right split window
`Ctrl+j` - jump to the bottom split window
`Ctrl+k` - jump to the upper split window
```

### KeyBind for Neo-Tree

- NORMAL mode

```help
`Ctrl+n` - open Neo-Tree on the left side
`Ctrl+g` - open Neo-Tree git_status floating window
```

### KeyBind for Telescope

- NORMAL mode

```help
`<leader>ff` - open file find
`<leader>fg` - open live grep window
`<leader>fb` - open find buffer window for current buffers```

### KeyBind for Comment

- NORMAL mode

```help
`gcc` - Toggles the current line using linewise comment
`gbc` - Toggles the current line using blockwise comment
`[count]gcc` - Toggles the number of line given as a prefix-count using linewise
`[count]gbc` - Toggles the number of line given as a prefix-count using blockwise
`gc[count]{motion}` - (Op-pending) Toggles the region using linewise comment
`gb[count]{motion}` - (Op-pending) Toggles the region using blockwise comments
```

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

### KeyBind for Noice

- NORMAL mode

```help
`<leader>ds` - Dsimiss all visible messages
```
