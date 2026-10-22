local colors = require("pria.colors").setup()

local pria = {
	normal = {
		a = { fg = colors.sky, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.comment, bg = colors.bg },
	},
	insert = {
		a = { fg = colors.green, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.comment, bg = colors.bg },
	},
	visual = {
		a = { fg = colors.rose, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.comment, bg = colors.bg },
	},
	replace = {
		a = { fg = colors.lilac, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.comment, bg = colors.bg },
	},
	command = {
		a = { fg = colors.blue, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.comment, bg = colors.bg },
	},
	terminal = {
		a = { fg = colors.cyan, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.comment, bg = colors.bg },
	},
	inactive = {
		a = { fg = colors.fg2, bg = colors.bg2 },
		b = { fg = colors.fg2, bg = colors.bg2 },
		c = { fg = colors.fg2, bg = colors.bg2 },
	},
}

return pria
