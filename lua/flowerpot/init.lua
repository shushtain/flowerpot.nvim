local config = require("flowerpot.config")
local palette = require("flowerpot.palette")
local utils = require("flowerpot.utils")

local M = {}

local core = {
	require("flowerpot.core.terminal"),
	require("flowerpot.core.editor"),
	require("flowerpot.core.syntax"),
}

local plugins = {
	require("flowerpot.plugins.telescope"),
	require("flowerpot.plugins.gitsigns"),
}

function M.colorscheme(variant)
	config.__setup({ variant = variant })

	vim.opt.termguicolors = true
	if vim.g.colors_name then
		vim.cmd("hi clear")
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "flowerpot"

	if variant == "light" then
		vim.o.background = "light"
	else
		vim.o.background = "dark"
	end

	local pal = palette.setup()
	for _, item in ipairs(core) do
		item.setup(pal)
	end
	for _, item in ipairs(plugins) do
		item.setup(pal)
	end
end

function M.setup(options)
	config.__setup(options)
end

return M
