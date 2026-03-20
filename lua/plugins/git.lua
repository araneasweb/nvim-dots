local map = require("config.util").map
local gitsigns = require("gitsigns")

require("git-conflict").setup({})
require("gitgraph").setup({})

gitsigns.setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged_enable = true,
	on_attach = function(bufnr)
		local function bufmap(mode, lhs, rhs, desc)
			map(mode, lhs, rhs, desc, { buffer = bufnr })
		end

		bufmap("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end, "Next hunk")

		bufmap("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end, "Previous hunk")

		bufmap("n", "<leader>hs", gitsigns.stage_hunk, "Stage hunk")
		bufmap("n", "<leader>hr", gitsigns.reset_hunk, "Reset hunk")
		bufmap("v", "<leader>hs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, "Stage selected hunk")
		bufmap("v", "<leader>hr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, "Reset selected hunk")
		bufmap("n", "<leader>hS", gitsigns.stage_buffer, "Stage buffer")
		bufmap("n", "<leader>hR", gitsigns.reset_buffer, "Reset buffer")
		bufmap("n", "<leader>hp", gitsigns.preview_hunk, "Preview hunk")
		bufmap("n", "<leader>hi", gitsigns.preview_hunk_inline, "Preview hunk inline")
		bufmap("n", "<leader>hb", function()
			gitsigns.blame_line({ full = true })
		end, "Blame line")
		bufmap("n", "<leader>hd", gitsigns.diffthis, "Diff this")
		bufmap("n", "<leader>hD", function()
			gitsigns.diffthis("~")
		end, "Diff this against ~")
		bufmap("n", "<leader>hq", gitsigns.setqflist, "Populate quickfix with hunks")
		bufmap("n", "<leader>hQ", function()
			gitsigns.setqflist("all")
		end, "Populate quickfix with all hunks")
		bufmap("n", "<leader>tb", gitsigns.toggle_current_line_blame, "Toggle line blame")
		bufmap("n", "<leader>tw", gitsigns.toggle_word_diff, "Toggle word diff")
		bufmap({ "o", "x" }, "ih", gitsigns.select_hunk, "Select hunk")
	end,
})

map("n", "<leader>gl", function()
	require("gitgraph").draw({}, { all = true, max_count = 5000 })
end, "Draw git graph")

map("n", "<leader>gg", "<cmd>LazyGit<CR>", "Open LazyGit")
