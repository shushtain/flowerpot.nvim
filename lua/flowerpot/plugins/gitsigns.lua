local M = {}

function M.setup(palette)
	local groups = {
		GitSignsAdd = { fg = palette.green.v40 },
		GitSignsChange = { fg = palette.yellow.v40 },
		GitSignsDelete = { fg = palette.red.v40 },
		GitSignsCurrentLineBlame = { fg = palette.gray.v40 },
	}

	for key, value in pairs(groups) do
		vim.api.nvim_set_hl(0, key, value)
	end
end

return M
