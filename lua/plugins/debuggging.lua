return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap-python",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			require("dapui").setup()
			require("dap-python").setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<leader>dc", dap.continue, {})
		end,
	},
}