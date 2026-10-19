local M = {}

M.url = "https://github.com/folke/flash.nvim"

---@type paradise.HighlightsFn
function M.get(c, opts)
	return {
		FlashBackdrop = { fg = c.dim },
		FlashLabel = { bg = c.substitute, bold = true, fg = c.bg },
	}
end

return M
