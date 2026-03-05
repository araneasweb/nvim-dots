local util = require("config.util")

require("nvim-treesitter").setup({})

local no_indent = {
	ruby = true,
}

local function attach_treesitter(bufnr, filetype)
	local language = vim.treesitter.language.get_lang(filetype)
	if not language or language == "" then
		return
	end

	local ok = pcall(vim.treesitter.language.add, language)
	if not ok then
		return
	end

	pcall(vim.treesitter.start, bufnr, language)

	if not no_indent[filetype] then
		vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end
end

vim.api.nvim_create_autocmd("FileType", {
	group = util.augroup("treesitter_start"),
	callback = function(args)
		attach_treesitter(args.buf, args.match)
	end,
})
