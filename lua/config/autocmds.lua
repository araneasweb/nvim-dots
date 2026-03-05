local util = require("config.util")

vim.api.nvim_create_autocmd("TextYankPost", {
	group = util.augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local function spaces_listchars(shift_width)
	return {
		tab = ">>",
		leadmultispace = "▏" .. (" "):rep(math.max(shift_width - 1, 0)),
	}
end

local function tabs_listchars()
	return {
		tab = "▏ ",
		leadmultispace = "__",
	}
end

local function update_listchars()
	local is_global = vim.v.option_type == "global"
	local opts = is_global and vim.opt or vim.opt_local

	local producer = opts.expandtab:get() and spaces_listchars or tabs_listchars
	local merged = vim.tbl_deep_extend("force", opts.listchars:get(), producer(opts.shiftwidth:get()))

	opts.listchars = merged
end

vim.api.nvim_create_autocmd("OptionSet", {
	group = util.augroup("listchars"),
	pattern = { "expandtab", "shiftwidth" },
	callback = update_listchars,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = util.augroup("listchars_init"),
	callback = update_listchars,
})
