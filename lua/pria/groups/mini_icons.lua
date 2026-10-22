local M = {}

M.url = "https://github.com/echasnovski/mini.icons"

---@type pria.HighlightsFn
function M.get(c, opts)
	return {
		MiniIconsGrey = { fg = c.fg2 },
		MiniIconsPurple = { fg = c.lilac },
		MiniIconsBlue = { fg = c.blue },
		MiniIconsAzure = { fg = c.sky },
		MiniIconsCyan = { fg = c.cyan },
		MiniIconsGreen = { fg = c.green },
		MiniIconsYellow = { fg = c.yellow },
		MiniIconsOrange = { fg = c.orange },
		MiniIconsRed = { fg = c.red },
	}
end

return M
