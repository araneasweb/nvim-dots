local map = require("config.util").map
local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["<Esc>"] = actions.close,
			},
		},
	},
	extensions = {
		["ui-select"] = require("telescope.themes").get_dropdown({}),
	},
})

telescope.load_extension("fzf")
telescope.load_extension("ui-select")

map("n", "<leader>ff", builtin.find_files, "Find files")
map("n", "<leader>fg", builtin.live_grep, "Live grep")
map("n", "<leader>rg", builtin.live_grep, "Live grep")
map("n", "<leader>fb", builtin.buffers, "Buffers")
map("n", "<leader>fh", builtin.help_tags, "Help tags")
map("n", "<leader>fk", builtin.keymaps, "Search keymaps")
map("n", "<leader>fd", builtin.diagnostics, "Search diagnostics")
map("n", "<leader>fr", builtin.resume, "Resume last picker")
map("n", "<leader>.", builtin.oldfiles, "Recent files")
map("n", "<leader><leader>", builtin.buffers, "Find existing buffers")
map("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, "Search in current buffer")
map("n", "<leader>fn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, "Find Neovim config files")
