local opt = vim.opt

opt.termguicolors = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.wrap = false
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.splitright = true
opt.splitbelow = true
opt.showmode = false
opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"
opt.timeoutlen = 1200
opt.updatetime = 300
opt.undofile = true

opt.list = true
opt.listchars = { trail = "_" }
opt.colorcolumn = { 80, 120 }

opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.smarttab = true
opt.shiftround = true

opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
opt.foldopen = { "block", "mark", "percent", "quickfix", "search", "tag", "undo" }

if vim.fn.executable("rg") == 1 then
	opt.grepprg = "rg --vimgrep --no-heading --smart-case"
	opt.grepformat:append("%f:%l:%c:%m")
end
