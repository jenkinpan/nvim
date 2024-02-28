local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- import vim setting and keymappings
require("core.keymaps")
require("core.options")
require("core.neovide")

-- import plugins, and the file location is `nvim/lua/plugins`
require("lazy").setup({ { import = "plugins" } })
