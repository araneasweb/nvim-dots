local M = {}

function M.augroup(name)
	return vim.api.nvim_create_augroup("user_" .. name, { clear = true })
end

function M.map(mode, lhs, rhs, desc, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false
	if desc then
		opts.desc = desc
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

function M.bufmap(bufnr, mode, lhs, rhs, desc, opts)
	opts = opts or {}
	opts.buffer = bufnr
	return M.map(mode, lhs, rhs, desc, opts)
end

return M
