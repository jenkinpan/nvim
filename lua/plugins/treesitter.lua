return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "lua", "vim", "markdown", "regex", "markdown_inline", "bash" },
			auto_install = true,
			highlight = { enalbe = true },
			indent = { enable = true },
		})
	end,
}
