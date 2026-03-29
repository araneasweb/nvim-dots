local ok, metals = pcall(require, "metals")
if not ok then
	return
end

local metals_config = metals.bare_config()
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

metals_config.settings = {
	useGlobalExecutable = true,
	metalsBinaryPath = vim.fn.exepath("metals"),
}

local group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "scala", "sbt", "java" },
	callback = function()
		metals.initialize_or_attach(metals_config)
	end,
	group = group,
})
