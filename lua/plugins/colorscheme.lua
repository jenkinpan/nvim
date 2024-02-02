return {
	"catppuccin/nvim",
	event = "VimEnter",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "frappe",
			background = {
				light = "frappe",
				dark = "mocha",
			},
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
