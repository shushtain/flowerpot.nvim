local M = {}

function M.setup()
	if vim.o.background == "light" then
		return require("flowerpot.swatches.light")
	else
		return require("flowerpot.swatches.dark")
	end
end

return M
