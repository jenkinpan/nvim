# Neovim Config

[中文说明](./README.zh-CN.md)

A personal Neovim configuration built around `vim.pack`, `Snacks`, LSP, and a small set of UI plugins.

## Highlights

- Plugin management with native `vim.pack`
- Startup, editing, and completion plugins split into explicit groups
- `Snacks` for explorer, picker, terminal, scratch buffers, git helpers, and UI utilities
- `tokyonight` theme with transparent sidebars and floats
- `bufferline`, `lualine`, `which-key`, and `noice` for core UI
- `mason`, `nvim-lspconfig`, `none-ls`, and `conform` for language tooling

## Structure

```text
init.lua
lua/
  core/
    option.lua
    keymaps.lua
    pack.lua
  plugins/
    colorscheme.lua
    snacks.lua
    bufferline.lua
    lualine.lua
    noice.lua
    lsp.lua
    mason.lua
    conform.lua
    none-ls.lua
    cmp.lua
```

## Startup Flow

`init.lua` loads:

1. `core.option`
2. `core.keymaps`
3. `core.pack`

`lua/core/pack.lua` is the main plugin entrypoint. It:

- defines plugin specs for `vim.pack`
- groups plugins by when they should load
- ensures plugin directories are added to `runtimepath`
- loads plugin config modules explicitly instead of scanning the entire `lua/plugins` directory

Current groups:

- `startup_specs` / `startup_modules`
  UI and theme plugins that should be available immediately
- `editing_specs` / `editing_modules`
  LSP, formatting, git, and editing helpers loaded on first file open
- `completion_specs` / `completion_modules`
  completion-related plugins loaded on first insert or cmdline entry

## Key Plugins

- `folke/snacks.nvim`
  Main picker, explorer, terminal, notifier, scratch, zen, and git UI
- `akinsho/bufferline.nvim`
  Buffer tabs with offsets for `Snacks` explorer and `Mason`
- `nvim-lualine/lualine.nvim`
  Statusline
- `folke/noice.nvim`
  Message and command-line UI
- `folke/tokyonight.nvim`
  Theme
- `mason-org/mason.nvim`
  External tool management
- `neovim/nvim-lspconfig`
  LSP configs, using `vim.lsp.config()` and `vim.lsp.enable()`
- `stevearc/conform.nvim`
  Formatting
- `nvimtools/none-ls.nvim`
  Diagnostics, code actions, and extra completion sources

## Common Keymaps

Leader key: `<Space>`

### Navigation

- `<C-h> <C-j> <C-k> <C-l>`: move between windows
- `<S-h> <S-l>`: previous/next buffer
- `<leader>bp`: pin current buffer

### Explorer and Search

- `<leader>e`: open `Snacks` explorer
- `<leader><space>`: smart file picker
- `<leader>ff`: find files
- `<leader>fg`: git files
- `<leader>/`: grep
- `<leader>fr`: recent files
- `<leader>sp`: find plugin config files

### Git and Diagnostics

- `<leader>gs`: git status
- `<leader>gl`: git log
- `<leader>gd`: git diff hunks
- `<leader>xx`: diagnostics via `Trouble`
- `<leader>xX`: current buffer diagnostics

### LSP

- `gd`: go to definition via `Snacks`
- `gr`: references
- `gI`: implementations
- `K`: hover
- `<leader>rn`: rename
- `<leader>ca`: code action
- `<leader>fd`: line diagnostics

### Tools

- `<leader>cm`: open `Mason`
- `<leader>gg`: open `lazygit`
- `<c-/>`: toggle terminal
- `<leader>z`: zen mode
- `<leader>.`: scratch buffer

## Adding a Plugin

When adding a new plugin:

1. Add the plugin spec to the correct section in `lua/core/pack.lua`
2. Create a config file under `lua/plugins/`
3. Add that config module to the matching module group in `lua/core/pack.lua`

Choose a group based on when the plugin is needed:

- `startup`
  Theme, statusline, tabs, notifications, UI
- `editing`
  LSP, formatting, git, diagnostics, file editing helpers
- `completion`
  completion and snippets

For plugins only needed on a keypress or command, prefer loading them from the mapping function in `lua/core/keymaps.lua`.

## Notes

- `nvim-pack-lock.json` is committed to keep plugin revisions stable
- `.DS_Store` and `nvim.log` are ignored in `.gitignore`
- This config currently targets modern Neovim and uses the 0.11+ LSP APIs
