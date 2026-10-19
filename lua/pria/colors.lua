local M = {}

local util = require("pria.util")

---@param opts? pria.Config
function M.setup(opts)
	opts = require("pria.config").extend(opts)
    -- stylua: ignore
	---@class Palette
	local palette = {
		bg  = "#212527", -- main background
		bg2 = "#1C1F21", -- secondary background (recessed: floats, popups)
		bg3 = "#2A2F32", -- raised surface + separator lines (cursorline, borders, titles)

		fg  = "#D1D1D1", -- main text
		fg2 = "#8C92AC", -- secondary text (periwinkle, seeds comment/faint)

		violet  =       "#B895DE", -- decorators, rare things  
		blue =          "#5AA6E6", -- keywords  
		green  =        "#6AC770", -- strings   
		orange =        "#EFA061", -- numbers, bools, nulls  
		yellow =        "#D7CB6E", -- UI only: warnings, search/match  
		teal =          "#5BD3C0", -- functions, methods  
		cyan =          "#92E1F0", -- types, builtin-types
		red =           "#E66B80", -- errors
		silver  =       "#B8D3D5", -- members/attributes (cool pale tone, distinct from fg)
	}

	---@class pria.ColorScheme: Palette
	local colors = vim.deepcopy(palette)

	colors.none = "NONE"

	-- the secondary text tones derive from fg2 so they stay in key with it
	colors.comment = util.darken(colors.fg2, 0.09) -- comments, dimmer than operators
	colors.faint = util.mix(colors.fg2, colors.bg, 0.45) -- line numbers, nontext, disabled

	-- Faint color washes: an accent mixed over the background.
	local wash = function(color, amount)
		return util.mix(colors.bg, color, amount)
	end

	-- unified selection (violet): Visual, menu/picker selection, LSP refs
	colors.selection = wash(colors.violet, 0.15)

	colors.success = colors.green
	colors.error = colors.red
	colors.warning = colors.yellow
	colors.info = colors.blue
	colors.hint = colors.cyan

	-- search & match
	colors.search = colors.yellow
	colors.search_bg = wash(colors.yellow, 0.20) -- faint yellow wash: non-current matches
	colors.substitute = colors.orange
	colors.match = colors.yellow
	colors.title = colors.cyan

	colors.git = {
		add = colors.green,
		delete = colors.red,
		change = colors.cyan,
	}

	colors.diff = {
		add = wash(colors.green, 0.12),
		change = wash(colors.cyan, 0.12),
		delete = wash(colors.red, 0.12),
		text = wash(colors.cyan, 0.28),
	}

	-- Inline diagnostics render as chips: a calm, desaturated accent for the
	-- text on a faint color-tinted background.
	local function annotation(accent)
		return util.desaturate(util.mix(colors.fg, accent, 0.5), 0.35)
	end

	colors.diagnostic_fg = {
		error = annotation(colors.red),
		warning = annotation(colors.yellow),
		info = annotation(colors.blue),
		hint = annotation(colors.cyan),
	}
	colors.diagnostic_bg = {
		error = wash(colors.red, 0.18),
		warning = wash(colors.yellow, 0.18),
		info = wash(colors.blue, 0.18),
		hint = wash(colors.cyan, 0.18),
	}

	if opts.terminal_colors then
		local terminal = {
			black = colors.bg,
			red = colors.red,
			green = colors.green,
			orange = colors.orange,
			blue = colors.cyan,
			magenta = colors.blue,
			cyan = colors.teal,
			white = colors.fg,
		}

		-- Brights are the light variants of their base color.
		-- ANSI "yellow" (slot 3) maps to `orange`, so bright_yellow follows it.
		local bright = 0.08
		for name, base in pairs({
			black = terminal.black,
			red = terminal.red,
			green = terminal.green,
			yellow = terminal.orange,
			blue = terminal.blue,
			magenta = terminal.magenta,
			cyan = terminal.cyan,
			white = terminal.white,
		}) do
			terminal["bright_" .. name] = util.lighten(base, bright)
		end

		colors.terminal = terminal
	end

	return colors
end

return M
