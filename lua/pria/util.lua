local M = {}

local me = debug.getinfo(1, "S").source:sub(2)
me = vim.fn.fnamemodify(me, ":h:h")

function M.mod(modname)
	if package.loaded[modname] then
		return package.loaded[modname]
	end
	local ret = loadfile(me .. "/" .. modname:gsub("%.", "/") .. ".lua")()
	package.loaded[modname] = ret
	return ret
end

---@param groups pria.Highlights
---@return pria.Highlights
function M.resolve(groups)
	for _, hl in pairs(groups) do
		if type(hl.style) == "table" then
			for k, v in pairs(hl.style) do
				hl[k] = v
			end
			hl.style = nil
		end
	end
	return groups
end

-- simple string interpolation.
-- example template: "${name} is ${value}"
---@param str string template string
---@param table table key value pairs to replace in the string
function M.template(str, table)
	return (
		str:gsub("($%b{})", function(w)
			return vim.tbl_get(table, unpack(vim.split(w:sub(3, -2), ".", { plain = true }))) or w
		end)
	)
end

return M
