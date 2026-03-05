require("catppuccin").setup({
	integrations = {
		cmp = true,
		gitsigns = true,
		telescope = true,
		treesitter = true,
		which_key = true,
		native_lsp = {
			enabled = true,
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
	},
})

vim.cmd.colorscheme("catppuccin")
