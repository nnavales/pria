local colors = require("pria.colors").setup()

local pria = {
	normal = {
		a = { fg = colors.cyan, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.dim, bg = colors.bg },
	},
	insert = {
		a = { fg = colors.green, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.dim, bg = colors.bg },
	},
	visual = {
		a = { fg = colors.orange, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.dim, bg = colors.bg },
	},
	replace = {
		a = { fg = colors.violet, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.dim, bg = colors.bg },
	},
	command = {
		a = { fg = colors.blue, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.dim, bg = colors.bg },
	},
	terminal = {
		a = { fg = colors.teal, bg = colors.bg, gui = "bold" },
		b = { fg = colors.fg, bg = colors.bg },
		c = { fg = colors.dim, bg = colors.bg },
	},
	inactive = {
		a = { fg = colors.muted, bg = colors.bg_dim },
		b = { fg = colors.muted, bg = colors.bg_dim },
		c = { fg = colors.muted, bg = colors.bg_dim },
	},
}

return pria
