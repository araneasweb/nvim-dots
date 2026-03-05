local util = require("config.util")
local lint = require("lint")

lint.linters_by_ft = {
	go = { "golangcilint" },
	lua = { "selene" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = util.augroup("lint"),
	callback = function()
		lint.try_lint()
	end,
})
