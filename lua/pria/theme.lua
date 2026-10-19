local M = {}

---@param opts? pria.Config
function M.setup(opts)
	opts = require("pria.config").extend(opts)
	local colors = require("pria.colors").setup(opts)
	local groups = require("pria.groups").setup(colors, opts)

	vim.cmd("highlight clear")

	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "pria"

	for group, hl in pairs(groups) do
		hl = type(hl) == "string" and { link = hl } or hl
		vim.api.nvim_set_hl(0, group, hl)
	end

	if opts.terminal_colors then
		M.terminal(colors)
	end
end

---@param colors pria.ColorScheme
function M.terminal(colors)
	vim.g.terminal_color_0 = colors.terminal.black
	vim.g.terminal_color_8 = colors.terminal.bright_black

	vim.g.terminal_color_7 = colors.terminal.white
	vim.g.terminal_color_15 = colors.terminal.bright_white

	vim.g.terminal_color_1 = colors.terminal.red
	vim.g.terminal_color_9 = colors.terminal.bright_red

	vim.g.terminal_color_2 = colors.terminal.green
	vim.g.terminal_color_10 = colors.terminal.bright_green

	vim.g.terminal_color_3 = colors.terminal.orange
	vim.g.terminal_color_11 = colors.terminal.bright_yellow

	vim.g.terminal_color_4 = colors.terminal.blue
	vim.g.terminal_color_12 = colors.terminal.bright_blue

	vim.g.terminal_color_5 = colors.terminal.magenta
	vim.g.terminal_color_13 = colors.terminal.bright_magenta

	vim.g.terminal_color_6 = colors.terminal.cyan
	vim.g.terminal_color_14 = colors.terminal.bright_cyan
end

return M
