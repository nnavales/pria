local colors = require("pria.colors").setup()

local pria = {
	normal = {
		a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg2 },
		c = { fg = colors.faint, bg = colors.bg2 },
	},
	insert = {
		a = { fg = colors.bg, bg = colors.green, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg2 },
		c = { fg = colors.faint, bg = colors.bg2 },
	},
	visual = {
		a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg2 },
		c = { fg = colors.faint, bg = colors.bg2 },
	},
	replace = {
		a = { fg = colors.bg, bg = colors.violet, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg2 },
		c = { fg = colors.faint, bg = colors.bg2 },
	},
	command = {
		a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg2 },
		c = { fg = colors.faint, bg = colors.bg2 },
	},
	terminal = {
		a = { fg = colors.bg, bg = colors.teal, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg2 },
		c = { fg = colors.faint, bg = colors.bg2 },
	},
	inactive = {
		a = { fg = colors.fg2, bg = colors.bg2 },
		b = { fg = colors.fg2, bg = colors.bg2 },
		c = { fg = colors.fg2, bg = colors.bg2 },
	},
}

return pria
