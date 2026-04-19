local util = require("config.util")

vim.api.nvim_create_autocmd("FileType", {
	group = util.augroup("haskell_tools"),
	pattern = { "haskell", "lhaskell" },
	callback = function(event)
		local ht = require("haskell-tools")
		local bufnr = event.buf

		util.bufmap(bufnr, "n", "<leader>ll", vim.lsp.codelens.run, "Haskell: run code lenses")
		util.bufmap(bufnr, "n", "<leader>ls", ht.hoogle.hoogle_signature, "Haskell: Hoogle signature")
		util.bufmap(bufnr, "n", "<leader>la", ht.lsp.buf_eval_all, "Haskell: eval all (HLS)")

		util.bufmap(bufnr, "n", "<leader>lr", ht.repl.toggle, "Haskell: toggle REPL")
		util.bufmap(bufnr, "n", "<leader>lf", function()
			ht.repl.toggle(vim.api.nvim_buf_get_name(bufnr))
		end, "Haskell: toggle REPL (current file)")
		util.bufmap(bufnr, "n", "<leader>lq", ht.repl.quit, "Haskell: quit REPL")
	end,
})
