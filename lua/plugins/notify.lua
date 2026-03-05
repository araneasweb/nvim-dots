require("notify").setup({
	background_colour = "#000000",
	stages = "fade_in_slide_out",
	timeout = 3000,
})

vim.notify = require("notify")
