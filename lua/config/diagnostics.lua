vim.diagnostic.config({
	virtual_text = false,
	virtual_lines = {
		current_line = true,
		severity = { min = vim.diagnostic.severity.WARN },
	},
	signs = true,
	underline = true,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "if_many",
	},
})
