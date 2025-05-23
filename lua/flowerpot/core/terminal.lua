local M = {}

function M.setup(palette)
	-- default
	vim.g.terminal_color_0 = palette.gray.v20
	vim.g.terminal_color_1 = palette.red.v55
	vim.g.terminal_color_2 = palette.green.v60
	vim.g.terminal_color_3 = palette.yellow.v75
	vim.g.terminal_color_4 = palette.blue.v65
	vim.g.terminal_color_5 = palette.magenta.v50
	vim.g.terminal_color_6 = palette.cyan.v70
	vim.g.terminal_color_7 = palette.gray.v80
	-- bright
	vim.g.terminal_color_8 = palette.gray.v30
	vim.g.terminal_color_9 = palette.red.v65
	vim.g.terminal_color_10 = palette.green.v70
	vim.g.terminal_color_11 = palette.yellow.v85
	vim.g.terminal_color_12 = palette.blue.v75
	vim.g.terminal_color_13 = palette.magenta.v60
	vim.g.terminal_color_14 = palette.cyan.v80
	vim.g.terminal_color_15 = palette.gray.v90
end

return M
