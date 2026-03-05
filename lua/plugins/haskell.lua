local util = require("config.util")

vim.api.nvim_create_autocmd("FileType", {
	group = util.augroup("haskell_tools"),
	pattern = { "haskell", "lhaskell" },
	callback = function(event)
		local ht = require("haskell-tools")

		util.bufmap(event.buf, "n", "<leader>cl", vim.lsp.codelens.run, "Haskell: run code lenses")
		util.bufmap(event.buf, "n", "<leader>hs", ht.hoogle.hoogle_signature, "Haskell: Hoogle signature")
		util.bufmap(event.buf, "n", "<leader>ea", ht.lsp.buf_eval_all, "Haskell: eval all (HLS)")
		util.bufmap(event.buf, "n", "<leader>rr", ht.repl.toggle, "Haskell: toggle REPL")
		util.bufmap(event.buf, "n", "<leader>rf", function()
			ht.repl.toggle(vim.api.nvim_buf_get_name(event.buf))
		end, "Haskell: toggle REPL (current file)")
		util.bufmap(event.buf, "n", "<leader>rq", ht.repl.quit, "Haskell: quit REPL")
	end,
})
