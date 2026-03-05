local map = require("config.util").map

map("n", "<C-h>", "<C-w>h", "Go to pane to the left of current pane")
map("n", "<C-j>", "<C-w>j", "Go to pane below current pane")
map("n", "<C-k>", "<C-w>k", "Go to pane above current pane")
map("n", "<C-l>", "<C-w>l", "Go to pane to the right of current pane")

map("n", "<C-d>", "<C-d>zz", "Go down half a page")
map("n", "<C-u>", "<C-u>zz", "Go up half a page")

map({ "n", "v" }, "j", "gj", "Go down one visual line")
map({ "n", "v" }, "k", "gk", "Go up one visual line")
map({ "n", "v" }, "0", "g0", "Go to beginning of visual line")
map({ "n", "v" }, "$", "g$", "Go to end of visual line")

map("v", ">", ">gv", "Indent selection forward")
map("v", "<", "<gv", "Indent selection backward")

map("n", "<A-j>", ":m+1<CR>", "Move line down")
map("n", "<A-k>", ":m-2<CR>", "Move line up")
map("v", "<A-j>", ":m '>+1<CR>gv", "Move selection down")
map("v", "<A-k>", ":m '<-2<CR>gv", "Move selection up")

map("t", "<Esc><Esc>", "<C-\\><C-n>", "Exit terminal mode")

map("n", "<leader>xp", "yy2o<ESC>kpV:!/usr/bin/env bash<CR>", "Execute paragraph in bash")
map("v", "<leader>xp", "y'<P'<O<ESC>'>o<ESC>:<C-u>'<,'>!/usr/bin/env bash<CR>", "Execute selection in bash")

map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostic message")
map("n", "<leader>q", vim.diagnostic.setloclist, "Populate location list with diagnostics")
