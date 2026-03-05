local function inlay_hints()
	return {
		includeInlayParameterNameHints = "all",
		includeInlayParameterHintsWhenArgumentMatchesName = true,
		includeInlayFunctionParameterTypeHints = true,
		includeInlayVariableTypeHints = true,
		includeInlayVariableTypeHintsWhenTypeMatchesName = true,
		includeInlayPropertyDeclarationTypeHints = true,
		includeInlayFunctionLikeReturnTypeHints = true,
		includeInlayEnumMemberValueHints = true,
	}
end

return {
	init_options = {
		preferences = {
			completeFunctionCalls = true,
		},
	},
	settings = {
		javascript = {
			inlayHints = inlay_hints(),
		},
		typescript = {
			inlayHints = inlay_hints(),
		},
		implicitProjectConfiguration = {
			checkJs = true,
			strictNullChecks = true,
		},
	},
}
