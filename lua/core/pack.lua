-- nvim/lua/core/pack.lua
local pack = vim.pack
local gh = function(x)
	return "https://github.com/" .. x
end

local plugin_groups = {
	startup_specs = {
		{ src = gh("f-person/auto-dark-mode.nvim"), name = "auto-dark-mode.nvim" },
		{ src = gh("folke/tokyonight.nvim"), name = "tokyonight.nvim" },
		{ src = gh("MunifTanjim/nui.nvim"), name = "nui.nvim" },
		{ src = gh("rcarriga/nvim-notify"), name = "nvim-notify" },
		{ src = gh("nvim-tree/nvim-web-devicons"), name = "nvim-web-devicons" },
		{ src = gh("folke/noice.nvim"), name = "noice.nvim" },
		{ src = gh("folke/which-key.nvim"), name = "which-key.nvim" },
		{ src = gh("folke/snacks.nvim"), name = "snacks.nvim" },
		{ src = gh("nvim-lualine/lualine.nvim"), name = "lualine.nvim" },
		{ src = gh("akinsho/bufferline.nvim"), name = "bufferline.nvim" },
	},
	editing_specs = {
		{ src = gh("stevearc/conform.nvim"), name = "conform.nvim" },
		{ src = gh("williamboman/mason-lspconfig.nvim"), name = "mason-lspconfig.nvim" },
		{ src = gh("mason-org/mason.nvim"), name = "mason.nvim" },
		{ src = gh("folke/trouble.nvim"), name = "trouble.nvim" },
		{ src = gh("neovim/nvim-lspconfig"), name = "nvim-lspconfig" },
		{ src = gh("nvimtools/none-ls.nvim"), name = "none-ls.nvim" },
		{ src = gh("lewis6991/gitsigns.nvim"), name = "gitsigns.nvim" },
		{ src = gh("folke/lazydev.nvim"), name = "lazydev.nvim" },
	},
	completion_specs = {
		{ src = gh("hrsh7th/nvim-cmp"), name = "nvim-cmp" },
		{ src = gh("hrsh7th/cmp-nvim-lsp"), name = "cmp-nvim-lsp" },
		{ src = gh("hrsh7th/cmp-buffer"), name = "cmp-buffer" },
		{ src = gh("hrsh7th/cmp-path"), name = "cmp-path" },
		{ src = gh("hrsh7th/cmp-cmdline"), name = "cmp-cmdline" },
		{ src = gh("L3MON4D3/LuaSnip"), name = "LuaSnip" },
		{ src = gh("saadparwaiz1/cmp_luasnip"), name = "cmp_luasnip" },
	},
	startup_modules = {
		{ module = "plugins.colorscheme", plugins = { "auto-dark-mode.nvim", "tokyonight.nvim" } },
		{ module = "plugins.snacks", plugins = { "snacks.nvim" } },
		{ module = "plugins.noice", plugins = { "nui.nvim", "nvim-notify", "noice.nvim" } },
		{ module = "plugins.which-key", plugins = { "which-key.nvim" } },
		{ module = "plugins.bufferline", plugins = { "nvim-web-devicons", "bufferline.nvim" } },
		{ module = "plugins.lualine", plugins = { "nvim-web-devicons", "lualine.nvim" } },
	},
	editing_modules = {
		{ module = "plugins.gitsigns", plugins = { "gitsigns.nvim" } },
		{ module = "plugins.lazydev", plugins = { "lazydev.nvim" } },
		{ module = "plugins.mason", plugins = { "mason.nvim" } },
		{ module = "plugins.lsp", plugins = { "nvim-lspconfig", "mason-lspconfig.nvim" } },
		{ module = "plugins.none-ls", plugins = { "none-ls.nvim" } },
		{ module = "plugins.conform", plugins = { "conform.nvim" } },
	},
	completion_modules = {
		{ module = "plugins.cmp", plugins = { "nvim-cmp", "cmp-nvim-lsp", "cmp-buffer", "cmp-path", "cmp-cmdline", "LuaSnip", "cmp_luasnip" } },
	},
}

local specs = {}
for _, group in ipairs({ "startup_specs", "editing_specs", "completion_specs" }) do
	vim.list_extend(specs, plugin_groups[group])
end

pack.add(specs)

local data_pack_root = vim.fn.stdpath("data") .. "/site/pack/core/opt"

local function plugin_path(plugin)
	return data_pack_root .. "/" .. plugin
end

local function ensure_plugin_in_rtp(plugin)
	local path = plugin_path(plugin)
	if vim.fn.isdirectory(path) ~= 1 then
		return false
	end

	local normalized = vim.fs.normalize(path)
	for _, rtp in ipairs(vim.api.nvim_list_runtime_paths()) do
		if vim.fs.normalize(rtp) == normalized then
			return true
		end
	end

	vim.opt.runtimepath:append(path)
	local after = path .. "/after"
	if vim.fn.isdirectory(after) == 1 then
		vim.opt.runtimepath:append(after)
	end

	return true
end

local function packadd(plugin)
	local ok, err = pcall(vim.cmd.packadd, plugin)
	if ok and ensure_plugin_in_rtp(plugin) then
		return true
	end

	if ensure_plugin_in_rtp(plugin) then
		return true
	end

	vim.schedule(function()
		vim.notify(("Failed to packadd %s: %s"):format(plugin, err), vim.log.levels.ERROR)
	end)

	return false
end

local function load(entry)
	for _, plugin in ipairs(entry.plugins or {}) do
		if not packadd(plugin) then
			return false
		end
	end

	local ok, err = pcall(require, entry.module)
	if ok then
		return true
	end

	vim.schedule(function()
		vim.notify(("Failed to load %s: %s"):format(entry.module, err), vim.log.levels.ERROR)
	end)

	return false
end

for _, module in ipairs(plugin_groups.startup_modules) do
	load(module)
end

local editing_group = vim.api.nvim_create_augroup("UserEditingPlugins", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
	group = editing_group,
	once = true,
	callback = function()
		for _, module in ipairs(plugin_groups.editing_modules) do
			load(module)
		end
	end,
})

local completion_group = vim.api.nvim_create_augroup("UserCompletionPlugins", { clear = true })
vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
	group = completion_group,
	once = true,
	callback = function()
		for _, module in ipairs(plugin_groups.completion_modules) do
			load(module)
		end
	end,
})
