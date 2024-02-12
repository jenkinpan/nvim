return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {},
	config = function()
		require("toggleterm").setup({
			size = 7,
			close_on_exit = true,
		})
	end,
}
