local map = require("config.util").map
local oil = require("oil")

oil.setup({
	default_file_explorer = true,
	columns = { "icon" },

	win_options = {
		signcolumn = "yes:2",
	},

	keymaps = {
		["gd"] = {
			desc = "Toggle detailed view",
			callback = function()
				local config = require("oil.config")
				if #config.columns == 1 then
					oil.set_columns({ "icon", "permissions", "size", "mtime" })
				else
					oil.set_columns({ "icon" })
				end
			end,
		},
	},

	view_options = {
		show_hidden = true,
	},
})

require("oil-git-status").setup({
	show_ignored = false,
})

map("n", "-", oil.open, "Open parent directory")
