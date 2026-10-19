require("paradise.types")
local config = require("paradise.config")

local M = {}

---@param opts? paradise.Config
function M.load(opts)
	opts = require("paradise.config").extend(opts)

	vim.o.background = "dark"
	return require("paradise.theme").setup(opts)
end

M.setup = config.setup

return M
