local M = {}

M.url = "https://github.com/echasnovski/mini.icons"

---@type paradise.HighlightsFn
function M.get(c, opts)
	return {
		MiniIconsGrey = { fg = c.dim },
		MiniIconsPurple = { fg = c.violet },
		MiniIconsBlue = { fg = c.blue },
		MiniIconsAzure = { fg = c.cyan },
		MiniIconsCyan = { fg = c.teal },
		MiniIconsGreen = { fg = c.green },
		MiniIconsYellow = { fg = c.yellow },
		MiniIconsOrange = { fg = c.orange },
		MiniIconsRed = { fg = c.red },
	}
end

return M
