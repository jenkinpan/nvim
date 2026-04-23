# Neovim 配置说明

[English Version](./README.md)

这是一个基于 `vim.pack`、`Snacks`、LSP 和少量 UI 插件构建的个人 Neovim 配置。

## 特性概览

- 使用原生 `vim.pack` 管理插件
- 将插件按启动时机划分为启动、编辑、补全三类
- 使用 `Snacks` 负责 explorer、picker、terminal、scratch、git 和部分 UI 能力
- 使用 `tokyonight` 主题，并保持侧边栏和浮窗透明
- 使用 `bufferline`、`lualine`、`which-key`、`noice` 作为核心 UI
- 使用 `mason`、`nvim-lspconfig`、`none-ls`、`conform` 提供语言开发能力

## 目录结构


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

## 启动流程

`init.lua` 会依次加载：

1. `core.option`
2. `core.keymaps`
3. `core.pack`

其中 `lua/core/pack.lua` 是整个插件系统的入口。它负责：

- 定义 `vim.pack` 的插件来源
- 按加载时机给插件分组
- 确保插件目录进入 `runtimepath`
- 显式加载插件配置模块，而不是扫描整个 `lua/plugins` 目录

当前插件分组如下：

- `startup_specs` / `startup_modules`
  启动时就应该立即生效的 UI 和主题插件
- `editing_specs` / `editing_modules`
  第一次打开文件时加载的 LSP、格式化、git、编辑增强插件
- `completion_specs` / `completion_modules`
  第一次进入插入模式或命令行时加载的补全相关插件

## 主要插件

- `folke/snacks.nvim`
  负责 picker、explorer、terminal、notifier、scratch、zen 和 git UI
- `akinsho/bufferline.nvim`
  负责 buffer 标签栏，并对 `Snacks` explorer 和 `Mason` 做 offset 处理
- `nvim-lualine/lualine.nvim`
  状态栏
- `folke/noice.nvim`
  消息和命令行 UI
- `folke/tokyonight.nvim`
  主题
- `mason-org/mason.nvim`
  外部工具管理
- `neovim/nvim-lspconfig`
  LSP 配置，当前使用 `vim.lsp.config()` 和 `vim.lsp.enable()`
- `stevearc/conform.nvim`
  格式化
- `nvimtools/none-ls.nvim`
  诊断、code action 和部分补全能力

## 常用快捷键

Leader 键为 `<Space>`

### 窗口与 Buffer

- `<C-h> <C-j> <C-k> <C-l>`：在窗口间移动
- `<S-h> <S-l>`：切换上一个 / 下一个 buffer
- `<leader>bp`：固定当前 buffer

### 文件浏览与搜索

- `<leader>e`：打开 `Snacks` explorer
- `<leader><space>`：智能文件选择
- `<leader>ff`：查找文件
- `<leader>fg`：查找 git 文件
- `<leader>/`：全局 grep
- `<leader>fr`：最近文件
- `<leader>sp`：查找插件配置文件

### Git 与诊断

- `<leader>gs`：git status
- `<leader>gl`：git log
- `<leader>gd`：git diff hunks
- `<leader>xx`：通过 `Trouble` 查看诊断
- `<leader>xX`：查看当前 buffer 的诊断

### LSP

- `gd`：通过 `Snacks` 跳转到定义
- `gr`：查看引用
- `gI`：查看实现
- `K`：悬停文档
- `<leader>rn`：重命名
- `<leader>ca`：code action
- `<leader>fd`：当前行诊断

### 工具

- `<leader>cm`：打开 `Mason`
- `<leader>gg`：打开 `lazygit`
- `<c-/>`：切换终端
- `<leader>z`：禅模式
- `<leader>.`：scratch buffer

## 如何新增插件

新增插件时，建议按下面步骤来做：

1. 在 `lua/core/pack.lua` 中把插件加入正确的 spec 分组
2. 在 `lua/plugins/` 下新建对应的配置文件
3. 把配置模块加入 `lua/core/pack.lua` 中对应的 module 分组

分组选择建议：

- `startup`
  主题、状态栏、标签栏、通知、UI
- `editing`
  LSP、格式化、git、诊断、编辑增强
- `completion`
  补全和 snippets

如果某个插件只会在按键或命令触发时使用，优先考虑在 `lua/core/keymaps.lua` 的映射函数里按需加载，而不是放进启动分组。

## 说明

- `nvim-pack-lock.json` 已提交，用于固定插件版本
- `.DS_Store` 和 `nvim.log` 已加入 `.gitignore`
- 当前配置面向现代 Neovim，并使用 0.11+ 的 LSP API
