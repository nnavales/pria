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

		fg  = "#D3D9DA", -- main text
		fg2 = "#8A9698", -- secondary text (seeds comment/faint)

		rose    =       "#F7ABD1", -- numbers, bools, literals
		blue =          "#79BCF6", -- keywords
		sky    =        "#ACEAFE", -- types, builtin-types
		cyan   =        "#34DACA", -- functions, methods
		green  =        "#89E28D", -- strings
		lilac  =        "#BFBAFA", -- decorators, search
		silver  =       "#A8BEC2", -- members/attributes

		yellow =        "#E3B341", -- UI only: warnings
		orange =        "#ECA25C",
		red =           "#FF7A7A", -- UI only: errors, deletions
	}

	---@class pria.ColorScheme: Palette
	local colors = vim.deepcopy(palette)

	colors.none = "NONE"

	colors.comment = util.mix(colors.fg2, colors.bg, 0.15)
	colors.faint = util.mix(colors.fg2, colors.bg, 0.62) -- line numbers, nontext, disabled
	colors.structure = util.darken(colors.silver, 0.055)

	-- Faint color washes: an accent mixed over the background.
	local wash = function(color, amount)
		return util.mix(colors.bg, color, amount)
	end

	-- unified selection: Visual, menu/picker selection, LSP refs
	colors.selection = wash(colors.blue, 0.28)

	colors.success = colors.green
	colors.error = colors.red
	colors.warning = colors.yellow
	colors.info = colors.blue
	colors.hint = colors.sky

	-- search & match:
	colors.search = colors.lilac
	colors.search_bg = wash(colors.lilac, 0.14)
	colors.substitute = colors.lilac
	colors.match = colors.lilac
	colors.title = colors.sky

	colors.git = {
		add = colors.green,
		delete = colors.red,
		change = colors.sky,
	}

	colors.diff = {
		add = wash(colors.green, 0.16),
		change = wash(colors.blue, 0.16),
		delete = wash(colors.red, 0.16),
		text = wash(colors.blue, 0.22),
	}

	-- Inline diagnostics render as chips: a calm, desaturated accent for the
	-- text on a faint color-tinted background.
	local function annotation(accent)
		return util.desaturate(util.mix(colors.fg, accent, 0.6), 0.2)
	end

	colors.diagnostic_fg = {
		error = annotation(colors.red),
		warning = annotation(colors.yellow),
		info = annotation(colors.blue),
		hint = annotation(colors.sky),
	}
	colors.diagnostic_bg = {
		error = wash(colors.red, 0.18),
		warning = wash(colors.yellow, 0.18),
		info = wash(colors.blue, 0.18),
		hint = wash(colors.sky, 0.18),
	}

	if opts.terminal_colors then
		local terminal = {
			black = colors.bg,
			red = colors.red,
			green = colors.green,
			yellow = colors.yellow,
			blue = colors.blue,
			magenta = colors.lilac,
			cyan = colors.cyan,
			white = colors.fg,
		}

		local bright = 0.08
		for name, base in pairs({
			black = terminal.black,
			red = terminal.red,
			green = terminal.green,
			yellow = terminal.yellow,
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
