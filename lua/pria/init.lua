require("pria.types")
local config = require("pria.config")

local M = {}

---@param opts? pria.Config
function M.load(opts)
	opts = require("pria.config").extend(opts)

	vim.o.background = "dark"
	return require("pria.theme").setup(opts)
end

M.setup = config.setup

--- Register the opt-in development commands (`PriaReload`, `PriaInspect`).
---@param opts? { reload?: boolean, inspect?: boolean }
function M.dev(opts)
	require("pria.dev").setup(opts)
end

return M
