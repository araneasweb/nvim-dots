require("render-markdown").setup({
	completions = { lsp = { enabled = true } },
	file_types = { "markdown", "markdown.agda" },
	html = {
		comment = {
			conceal = false,
		},
	},
})
