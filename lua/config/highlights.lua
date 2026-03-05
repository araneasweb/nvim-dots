local folded = vim.api.nvim_get_hl(0, { name = "Folded" })
folded.bg = "#342E4F"
vim.api.nvim_set_hl(0, "Folded", folded)

local vert_split = vim.api.nvim_get_hl(0, { name = "VertSplit" })
vert_split.bg = nil
vim.api.nvim_set_hl(0, "VertSplit", vert_split)
