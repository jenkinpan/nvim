if vim.loader then
	vim.loader.enable()
end

require("core.option")
require("core.autocmd")
require("core.keymaps")
require("core.pack")
