local map = require("config.util").map
local textobjects = require("nvim-treesitter-textobjects")
local select = require("nvim-treesitter-textobjects.select")
local move = require("nvim-treesitter-textobjects.move")

textobjects.setup({
	select = {
		lookahead = true,
		selection_modes = {
			["@function.outer"] = "V",
			["@class.outer"] = "V",
		},
	},
	move = {
		set_jumps = true,
	},
})

map({ "x", "o" }, "af", function()
	select.select_textobject("@function.outer", "textobjects")
end, "Select around function")

map({ "x", "o" }, "if", function()
	select.select_textobject("@function.inner", "textobjects")
end, "Select inside function")

map({ "x", "o" }, "ac", function()
	select.select_textobject("@class.outer", "textobjects")
end, "Select around class")

map({ "x", "o" }, "ic", function()
	select.select_textobject("@class.inner", "textobjects")
end, "Select inside class")

map({ "n", "x", "o" }, "]m", function()
	move.goto_next_start("@function.outer", "textobjects")
end, "Next function start")

map({ "n", "x", "o" }, "[m", function()
	move.goto_previous_start("@function.outer", "textobjects")
end, "Previous function start")

map({ "n", "x", "o" }, "]M", function()
	move.goto_next_end("@function.outer", "textobjects")
end, "Next function end")

map({ "n", "x", "o" }, "[M", function()
	move.goto_previous_end("@function.outer", "textobjects")
end, "Previous function end")

map({ "n", "x", "o" }, "]]", function()
	move.goto_next_start("@class.outer", "textobjects")
end, "Next class start")

map({ "n", "x", "o" }, "[[", function()
	move.goto_previous_start("@class.outer", "textobjects")
end, "Previous class start")
