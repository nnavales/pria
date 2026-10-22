local M = {}

M.url = "https://github.com/folke/lazy.nvim"

---@type pria.HighlightsFn
function M.get(c, opts)
	return {
		LazyProgressDone = { bold = true, fg = c.green },
		LazyProgressTodo = { bold = true, fg = c.lilac },
	}
end

return M
