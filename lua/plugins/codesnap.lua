return {
	"mistricky/codesnap.nvim",
	build = "make",
	event = "VeryLazy",
	config = function()
		require("codesnap").setup({
			mac_window_bar = true,
			opacity = true,
			watermark = "Code from Jenkin",
			preview_title = "CodeSnap.nvim",
			editor_font_family = "Hack",
			watermark_font_family = "Pacifico",
		})
	end,
}
