local map = require("config.util").map
local dap = require("dap")
local dapui = require("dapui")
local layers = require("layers")

require("nvim-dap-virtual-text").setup({})
dapui.setup({})

dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "-i", "dap" },
}

dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
}
dap.configurations.cpp = dap.configurations.c

dap.listeners.before.attach.dapui = function()
	dapui.open()
end

dap.listeners.before.launch.dapui = function()
	dapui.open()
end

dap.listeners.before.event_terminated.dapui = function()
	dapui.close()
end

dap.listeners.before.event_exited.dapui = function()
	dapui.close()
end

local debug_mode = layers.mode.new()
debug_mode:auto_show_help()
debug_mode:keymaps({
	n = {
		{ "s", dap.step_over, { desc = "Step over" } },
		{ "i", dap.step_into, { desc = "Step into" } },
		{ "S", dap.step_out, { desc = "Step out" } },
		{ "b", dap.toggle_breakpoint, { desc = "Toggle breakpoint" } },
		{ "c", dap.continue, { desc = "Continue" } },
		{
			"<Esc>",
			function()
				debug_mode:deactivate()
			end,
			{ desc = "Exit debug mode" },
		},
		{ "o", dapui.open, { desc = "Open debug UI" } },
		{ "x", dapui.close, { desc = "Close debug UI" } },
	},
})

map("n", "<leader>dbg", function()
	debug_mode:activate()
end, "Enter debug mode")
