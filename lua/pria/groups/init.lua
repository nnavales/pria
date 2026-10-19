local Util = require("pria.util")

local M = {}

M.plugins = {
	["telescope.nvim"] = "telescope",
	["lazy.nvim"] = "lazy",
	["nvim-cmp"] = "cmp",
	["flash.nvim"] = "flash",
	["fff.nvim"] = "fff",
	["grug-far.nvim"] = "grug-far",
	["mini.icons"] = "mini_icons",
	["neogit"] = "neogit",
	["snacks.nvim"] = "snacks",
}

function M.get_group(name)
	---@type {get: pria.HighlightsFn, url: string}
	return Util.mod("pria.groups." .. name)
end

---@param colors pria.ColorScheme
---@param opts pria.Config
function M.get(name, colors, opts)
	local mod = M.get_group(name)
	return mod.get(colors, opts)
end

---@param colors pria.ColorScheme
---@param opts pria.Config
function M.setup(colors, opts)
	local groups = {
		base = true,
		kinds = true,
		semantic_tokens = true,
		treesitter = true,
	}

	-- autodetect lazy.nvim plugins
	if package.loaded.lazy then
		local lazy_plugins = require("lazy.core.config").plugins
		for plugin, group in pairs(M.plugins) do
			if lazy_plugins[plugin] then
				groups[group] = true
			end
		end
	else
		-- no lazy.nvim: load all plugins
		for _, group in pairs(M.plugins) do
			groups[group] = true
		end
	end

	-- ovederride plugings manually
	for name, enabled in pairs(opts.plugins) do
		if type(enabled) == "boolean" then
			groups[name] = enabled or nil
		end
	end

	local ret = {}
	-- merge highlights
	for group in pairs(groups) do
		for k, v in pairs(M.get(group, colors, opts)) do
			ret[k] = v
		end
	end
	Util.resolve(ret)

	return ret
end

return M
