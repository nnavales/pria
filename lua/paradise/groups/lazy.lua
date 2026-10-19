local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@type paradise.HighlightsFn
function M.get(c, opts)
	return {
		LazyProgressDone = { bold = true, fg = c.green },
		LazyProgressTodo = { bold = true, fg = c.violet },
	}
end

return M
