local M = {}

function M.setup(palette)
	local groups = {
		WhichKeyNormal = { fg = palette.gray.v80, bg = palette.gray.v10 },
	}

	for key, value in pairs(groups) do
		vim.api.nvim_set_hl(0, key, value)
	end
end

return M
