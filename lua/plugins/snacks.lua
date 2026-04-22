-- lua/plugins/snacks.lua

local ok, Snacks = pcall(require, "snacks")
if not ok then
	return
end

Snacks.setup({
	bigfile = { enabled = true },
	explorer = { enabled = true },
	indent = { enabled = true },
	input = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 3000,
	},
	picker = { enabled = true },
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	styles = {
		notification = {
			-- wo = { wrap = true }, -- Wrap notifications
		},
	},
})

-- ====== 按键映射：把原来的 keys 表改成 vim.keymap.set ======

-- ====== 把原来的 init 函数改成普通 autocmd ======

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		-- 全局调试 helper
		_G.dd = function(...)
			Snacks.debug.inspect(...)
		end
		_G.bt = function()
			Snacks.debug.backtrace()
		end

		-- 覆盖 print / vim.print
		if vim.fn.has("nvim-0.11") == 1 then
			vim._print = function(_, ...)
				dd(...)
			end
		else
			vim.print = _G.dd
		end

		-- 各种 toggle 映射
		Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
		Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
		Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
		Snacks.toggle.diagnostics():map("<leader>ud")
		Snacks.toggle.line_number():map("<leader>ul")
		Snacks.toggle
			.option("conceallevel", {
				off = 0,
				on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2,
			})
			:map("<leader>uc")
		Snacks.toggle.treesitter():map("<leader>uT")
		Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
		Snacks.toggle.inlay_hints():map("<leader>uh")
		Snacks.toggle.indent():map("<leader>ug")
		Snacks.toggle.dim():map("<leader>uD")
	end,
})
