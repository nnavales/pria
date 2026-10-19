local colors = require("paradise.colors").setup()

local paradise = {
	normal = {
		a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
		b = { fg = colors.fg, bg = colors.surface },
		c = { fg = colors.dim, bg = colors.surface },
	},
	insert = {
		a = { fg = colors.bg, bg = colors.green, gui = "bold" },
		b = { fg = colors.fg, bg = colors.surface },
		c = { fg = colors.dim, bg = colors.surface },
	},
	visual = {
		a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
		b = { fg = colors.fg, bg = colors.surface },
		c = { fg = colors.dim, bg = colors.surface },
	},
	replace = {
		a = { fg = colors.bg, bg = colors.violet, gui = "bold" },
		b = { fg = colors.fg, bg = colors.surface },
		c = { fg = colors.dim, bg = colors.surface },
	},
	command = {
		a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
		b = { fg = colors.fg, bg = colors.surface },
		c = { fg = colors.dim, bg = colors.surface },
	},
	terminal = {
		a = { fg = colors.bg, bg = colors.teal, gui = "bold" },
		b = { fg = colors.fg, bg = colors.surface },
		c = { fg = colors.dim, bg = colors.surface },
	},
	inactive = {
		a = { fg = colors.muted, bg = colors.bg_dim },
		b = { fg = colors.muted, bg = colors.bg_dim },
		c = { fg = colors.muted, bg = colors.bg_dim },
	},
}

return paradise
