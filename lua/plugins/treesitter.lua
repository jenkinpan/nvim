return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"lua",
				"vim",
				"regex",
				"markdown",
				"markdown_inline",
				"bash",
				"rust",
				"css",
				"html",
				"gitignore",
				"javascript",
				"python",
				"slint",
				"norg",
				"org",
			},
			auto_install = true,
			highlight = { enalbe = true },
			indent = { enable = true },
		})
	end,
}
