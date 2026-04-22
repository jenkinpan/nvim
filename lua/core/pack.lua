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
	{ src = gh("mason-org/mason.nvim") },
	{ src = gh("folke/trouble.nvim") },
	{ src = gh("folke/snacks.nvim") },
	{ src = gh("nvim-lualine/lualine.nvim") },
}

pack.add(specs)

local config_dir = vim.fn.stdpath("config") .. "/lua/plugins"

for _, file in ipairs(vim.fn.readdir(config_dir)) do
	if file:match("%.lua$") and file ~= "init.lua" then
		local modname = "plugins." .. file:sub(1, -5)
		require(modname)
	end
end
