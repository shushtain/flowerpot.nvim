local M = {}

M.defaults = {
	variant = "auto",
}

---@class Config
---@field variant string: "auto" | "dark" | "light"
M.options = {}

function M.__setup(options)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

return M
