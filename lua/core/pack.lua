-- nvim/lua/core/pack.lua
local pack = vim.pack
local gh = function(x)
	return "https://github.com/" .. x
end

local specs = {
	{ src = gh("f-person/auto-dark-mode.nvim") },
	{ src = gh("folke/tokyonight.nvim"), name = "tokyonight.nvim" },
	{ src = gh("MunifTanjim/nui.nvim") },
	{ src = gh("rcarriga/nvim-notify") },
	{ src = gh("nvim-tree/nvim-web-devicons") },
	{ src = gh("folke/noice.nvim"), name = "noice.nvim" },
	{ src = gh("stevearc/conform.nvim"), name = "conform.nvim" },
	{ src = gh("folke/which-key.nvim") },
	{ src = gh("williamboman/mason-lspconfig.nvim") },
	{ src = gh("mason-org/mason.nvim") },
	{ src = gh("folke/trouble.nvim") },
	{ src = gh("folke/snacks.nvim") },
	{ src = gh("nvim-lualine/lualine.nvim") },
	{ src = gh("neovim/nvim-lspconfig") },
	{ src = gh("nvimtools/none-ls.nvim"), name = "none-ls.nvim" },
	{ src = gh("hrsh7th/nvim-cmp") },
	{ src = gh("hrsh7th/cmp-nvim-lsp") },
	{ src = gh("hrsh7th/cmp-buffer") },
	{ src = gh("hrsh7th/cmp-path") },
	{ src = gh("hrsh7th/cmp-cmdline") },
	{ src = gh("L3MON4D3/LuaSnip") },
	{ src = gh("saadparwaiz1/cmp_luasnip") },
	-- 新增：gitsigns（none-ls 的 code_actions 需要依赖此插件）
	{ src = gh("lewis6991/gitsigns.nvim"), name = "gitsigns.nvim" },
	-- 新增：lazydev，用于替换手动配置 lua_ls 的 vim 全局变量
	{ src = gh("folke/lazydev.nvim"), name = "lazydev.nvim" },
}

pack.add(specs)

local config_dir = vim.fn.stdpath("config") .. "/lua/plugins"

for _, file in ipairs(vim.fn.readdir(config_dir)) do
	if file:match("%.lua$") and file ~= "init.lua" then
		local modname = "plugins." .. file:sub(1, -5)
		require(modname)
	end
end
