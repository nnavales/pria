local M = {}

---@class pria.Config
---@field transparent boolean
---@field dim boolean
---@field borders boolean
---@field terminal_colors boolean
---@field styles table
---@field plugins table<string, boolean>
M.defaults = {
	transparent = false, -- disable background color (use terminal background)
	dim = true, -- dim inactive window `:h hl-NormalNC`
	borders = true, -- show borders around floating windows and popups
	styles = { -- syntax element styles: { italic = true, bold = true, underline = true}
		keywords = {},
		functions = {},
		types = {},
		comments = { italic = true },
		builtins = { italic = true },
	},
	terminal_colors = true, -- terminal colors when using :terminal

	---@type table<string, boolean>
	-- default: auto-detect with lazy.nvim, or load all if not using lazy
	plugins = {}, -- plugin highlight overrides (e.g., telescope = false to disable)
}

---@type pria.Config
M.options = vim.tbl_deep_extend("force", {}, M.defaults)

---@param options? pria.Config
function M.setup(options)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? pria.Config
function M.extend(opts)
	return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

return M
