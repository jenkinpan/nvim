return {
	"mistricky/codesnap.nvim",
	build = "make",
	version = "^1",
	event = "VeryLazy",
	config = function()
		require("codesnap").setup({
			mac_window_bar = true,
			title = "Codesnap.nvim",
			watermark = "Code from Jenkin",
			code_font_family = "Hack",
			watermark_font_family = "Pacifico",
			save_path = "~/Pictures/codesnap.png",
		})
	end,
}
