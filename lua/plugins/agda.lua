vim.g.cornelis_use_global_binary = 1
vim.g.cornelis_agda_prefix = ";"

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "agda", "markdown.agda" },
	callback = function(args)
		local opts = { buffer = args.buf, silent = true }
		local ft = vim.bo[args.buf].filetype
		if ft == "agda" then
			vim.bo[args.buf].commentstring = "-- %s"
		end
		vim.keymap.set("n", "<leader>lal", "<cmd>CornelisLoad<CR>", opts)
		vim.keymap.set("n", "<leader>lar", "<cmd>CornelisRefine<CR>", opts)
		vim.keymap.set("n", "<leader>lac", "<cmd>CornelisMakeCase<CR>", opts)
		vim.keymap.set("n", "<leader>lag", "<cmd>CornelisGoals<CR>", opts)
		vim.keymap.set("n", "<leader>lat", "<cmd>CornelisTypeContext<CR>", opts)
		vim.keymap.set("n", "<leader>lan", "<cmd>CornelisNormalize<CR>", opts)
		vim.keymap.set("n", "<leader>las", "<cmd>CornelisSolve<CR>", opts)
		vim.keymap.set("n", "<leader>lad", "<cmd>CornelisGoToDefinition<CR>", opts)
		vim.keymap.set("n", "la]?", "<cmd>CornelisNextGoal<CR>", opts)
		vim.keymap.set("n", "la[?", "<cmd>CornelisPrevGoal<CR>", opts)
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.agda", "*.lagda", "*.lagda.*", "*.lagda.md" },
	callback = function(args)
		local ft = vim.bo[args.buf].filetype
		if ft == "agda" or ft == "markdown.agda" then
			vim.cmd("silent! CornelisLoad")
		end
	end,
})
