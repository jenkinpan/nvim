local wk = require("which-key")

wk.setup({
	preset = "helix",
})

wk.add({
	{ "<leader>b", group = "buffer" },
	{ "<leader>c", group = "code" },
	{ "<leader>f", group = "file/find" },
	{ "<leader>g", group = "git" },
	{ "<leader>n", desc = "notification history" },
	{ "<leader>s", group = "search" },
	{ "<leader>sn", group = "noice" },
	{ "<leader>u", group = "ui/toggle" },
	{ "<leader>w", proxy = "<c-w>", group = "windows" },
	{ "<leader>x", group = "diagnostics/list" },
	{ "<leader><tab>", group = "tabs" },
	{
		mode = { "n", "v" },
		{ "<leader>q", group = "quit/session" },
	},
})
