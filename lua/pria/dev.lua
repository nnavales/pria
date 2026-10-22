-- Development helpers. Opt-in via `require("pria").dev()`.
local M = {}

-- Build a reverse map of "#rrggbb" -> palette key (e.g. "#34daca" -> "cyan").
local function palette_map()
	local colors = require("pria.colors").setup()
	local map = {}
	local function walk(t, prefix)
		for k, v in pairs(t) do
			if type(v) == "string" and v:match("^#%x%x%x%x%x%x$") then
				-- Prefer the shortest path when a color is reused (e.g. `blue`
				-- over `terminal.magenta`).
				local key = prefix .. k
				local current = map[v:lower()]
				if current == nil or #key < #current or (#key == #current and key < current) then
					map[v:lower()] = key
				end
			elseif type(v) == "table" then
				walk(v, prefix .. k .. ".")
			end
		end
	end
	walk(colors, "")
	return map
end

local ATTRS = { "bold", "italic", "underline", "undercurl", "strikethrough", "reverse" }

local function describe(group, palette)
	local link = vim.api.nvim_get_hl(0, { name = group, link = true }).link
	local hl = vim.api.nvim_get_hl(0, { name = group, link = false })

	local function color(value)
		if value == nil then
			return nil
		end
		local hex = string.format("#%06X", value):lower()
		local name = palette[hex]
		return name and ("%s (%s)"):format(hex, name) or hex
	end

	local parts = {}
	local fg = color(hl.fg)
	local bg = color(hl.bg)
	if fg then
		parts[#parts + 1] = "fg=" .. fg
	end
	if bg then
		parts[#parts + 1] = "bg=" .. bg
	end
	for _, attr in ipairs(ATTRS) do
		if hl[attr] then
			parts[#parts + 1] = attr
		end
	end

	local line = group
	if link then
		line = line .. " -> " .. link
	end
	if #parts > 0 then
		line = line .. "  " .. table.concat(parts, " ")
	end
	return line
end

-- Every highlight group applied at the cursor, deduplicated.
local function groups_at_cursor()
	local buf = vim.api.nvim_get_current_buf()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local row, col = cursor[1] - 1, cursor[2]
	local info = vim.inspect_pos(buf, row, col)

	local seen, ordered = {}, {}
	local function add(group, source)
		if not group or group == "" or seen[group] then
			return
		end
		seen[group] = true
		ordered[#ordered + 1] = { group = group, source = source }
	end

	for _, item in ipairs(info.semantic_tokens or {}) do
		add(item.opts and item.opts.hl_group, "semantic")
	end
	for _, item in ipairs(info.treesitter or {}) do
		add(item.hl_group, "treesitter")
	end
	for _, item in ipairs(info.syntax or {}) do
		add(item.hl_group, "syntax")
	end
	for _, item in ipairs(info.extmarks or {}) do
		local g = item.opts and item.opts.hl_group
		if type(g) == "table" then
			for _, gg in ipairs(g) do
				add(gg, "extmark")
			end
		elseif type(g) == "string" then
			add(g, "extmark")
		end
	end

	-- syntax fallback (in case inspect_pos yields nothing for the buffer)
	for _, id in ipairs(vim.fn.synstack(row + 1, col + 1)) do
		add(vim.fn.synIDattr(id, "name"), "syntax")
	end

	return ordered
end

local function float(lines)
	local width = 0
	for _, line in ipairs(lines) do
		width = math.max(width, vim.fn.strdisplaywidth(line))
	end
	local buf = vim.api.nvim_create_buf(false, true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "cursor",
		row = 1,
		col = 0,
		width = width + 2,
		height = #lines,
		style = "minimal",
		border = "rounded",
	})
	local function close()
		if vim.api.nvim_win_is_valid(win) then
			vim.api.nvim_win_close(win, true)
		end
	end
	vim.keymap.set("n", "q", close, { buffer = buf })
	vim.keymap.set("n", "<Esc>", close, { buffer = buf })
end

-- Reload the colorscheme from disk, keeping the configured options.
function M.reload()
	local opts = vim.deepcopy(require("pria.config").options)
	for name in pairs(package.loaded) do
		if name:match("^pria") or name:match("^lualine%.themes%.pria") then
			package.loaded[name] = nil
		end
	end
	require("pria").load(opts)
	vim.api.nvim_echo({ { "Theme reloaded", "None" } }, false, {})
end

-- Show the highlight group(s) under the cursor and map colors back to the palette.
function M.inspect()
	local palette = palette_map()
	local entries = groups_at_cursor()
	if #entries == 0 then
		vim.notify("PriaInspect: no highlight group under cursor", vim.log.levels.WARN)
		return
	end

	local lines, names = {}, {}
	for _, entry in ipairs(entries) do
		names[#names + 1] = entry.group
		lines[#lines + 1] = string.format("%-10s %s", "[" .. entry.source .. "]", describe(entry.group, palette))
	end
	vim.fn.setreg("+", table.concat(names, "\n"))
	float(lines)
end

---@param opts? { reload?: boolean, inspect?: boolean }
function M.setup(opts)
	opts = opts or {}
	if opts.reload ~= false then
		vim.api.nvim_create_user_command("PriaReload", M.reload, { desc = "Reload the pria colorscheme" })
	end
	if opts.inspect ~= false then
		vim.api.nvim_create_user_command(
			"PriaInspect",
			M.inspect,
			{ desc = "Inspect the highlight group under the cursor" }
		)
	end
end

return M
