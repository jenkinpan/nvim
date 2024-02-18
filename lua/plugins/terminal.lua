return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
	opts = {},
	config = function()
		require("toggleterm").setup({
			size = 7,
			close_on_exit = true,
		})
	end,
}
