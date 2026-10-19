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

return M
