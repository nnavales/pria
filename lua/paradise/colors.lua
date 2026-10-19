local M = {}

---@param opts? paradise.Config
function M.setup(opts)
	opts = require("paradise.config").extend(opts)
    -- stylua: ignore
	---@class Palette
	local palette = {
		violet  =       "#B895DE", -- decorators, rare things  
		blue =          "#5AA6E6", -- keywords  
		green  =        "#5FC878", -- strings   
		orange =        "#ECA25C", -- numbers, bools, nulls  
		yellow =        "#E4C56B", -- UI only: warnings, search/match  
		teal =          "#5FD3BB", -- functions, methods  
		cyan =          "#A1DEEA", -- types, builtin-types
		red =           "#E66B80", -- errors
		attribute =     "#B8D3D5", -- attributes & members (cool-grey, distinct from fg)

		-- foreground (bright → dim)
		fg       = "#DCE5E5", -- main text
		muted    = "#789AA1", -- comments, operators, punctuation
		dim      = "#4B5B63", -- line numbers, nontext, disabled

		-- backgrounds (dark → light)
		bg_dim  = "#131416", -- inactive windows, sidebars
		bg      = "#181A1C", -- main background
		surface = "#1E2124", -- floats, statusline, popups
		overlay = "#282B2F", -- borders, raised elements

		-- highlight washes (low → high)
		highlight_low  = "#1B1F23",
		highlight_med  = "#1F2428",
		highlight_high = "#33383D",
	}

	---@class paradise.ColorScheme: Palette
	local colors = vim.deepcopy(palette)

	colors.none = "NONE"

	-- tinted visual selection (blue-slate, H207) — distinct from neutral menu selection
	colors.visual = "#2F2735"

	-- comments: dimmer than muted (punctuation/operators) so they read as a separate layer
	colors.comment = "#607C85"

	-- neutral secondary UI text (completion candidates, picker results) — flatter than muted
	colors.subtle = "#5C6870"

	colors.success = colors.green
	colors.error = colors.red
	colors.warning = colors.yellow
	colors.info = colors.blue
	colors.hint = colors.cyan

	-- search & match
	colors.search = colors.yellow
	colors.search_bg = "#433B23" -- muted yellow wash: non-current matches read as faint yellow regions
	colors.substitute = colors.orange
	colors.match = colors.yellow
	colors.title = colors.cyan

	colors.git = {
		add = colors.green,
		delete = colors.red,
		change = colors.cyan,
	}

	colors.diff = {
		add = "#1D2F21",
		change = "#1E282F",
		delete = "#2F1D20",
		text = "#2B4050",
	}

	-- inline diagnostics render as chips: muted fg (calm annotation) on a faint color-tinted bg
	colors.diagnostic_fg = {
		error = "#C37A8B",
		warning = "#C1B77C",
		info = "#64A2D0",
		hint = "#91C1CB",
	}
	colors.diagnostic_bg = {
		error = "#39272C",
		warning = "#393529",
		info = "#23303C",
		hint = "#2D383B",
	}

	if opts.terminal_colors then
		colors.terminal = {
			black = colors.bg,
			red = colors.red,
			green = colors.green,
			orange = colors.orange,
			blue = colors.cyan,
			magenta = colors.blue,
			cyan = colors.teal,
			white = colors.fg,

			bright_black = colors.highlight_high,
			bright_red = "#EDABB6",
			bright_green = "#98D6A7",
			bright_yellow = "#F0C79F",
			bright_blue = "#D5EAEF",
			bright_magenta = "#9CC7EC",
			bright_cyan = "#9BDED0",
			bright_white = "#F3F6F6",
		}
	end

	return colors
end

return M
