local map = vim.keymap.set
-- Only in neovide, the below keymaps work
-- require neovide
if vim.g.neovide then
	vim.g.neovide_transparency = 0.8
	vim.g.neovide_hide_mouse_when_typing = true

	map("v", "<C-c>", '"+y') -- Copy
	map("n", "<C-v>", '"+P') -- Paste normal mode
	map("v", "<C-v>", '"+P') -- Paste visual mode
	map("c", "<C-v>", "<C-R>+") -- Paste command mode
	map("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode
end
