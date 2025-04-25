local M = {}

function M.setup(palette)
	local groups = {
		--[[ GENERAL ]]
		-- text and background of the main editor
		Normal = { fg = palette.gray.v90, bg = palette.gray.v10 },
		-- same but for non-current (inactive, unfocused) windows
		NormalNC = { link = "Normal" },
		-- the line that separates split windows
		WinSeparator = { fg = palette.gray.v30 },

		--[[ CURSOR ]]
		-- standard cursor
		Cursor = { fg = palette.gray.v10, bg = palette.gray.v90 },
		-- these are for languages that use IME (Chinese, Japanese, Korean, etc)
		lCursor = { link = "Cursor" },
		CursorIM = { link = "Cursor" },
		-- cursor in terminal windows
		TermCursor = { link = "Cursor" },

		--[[ GUIDES ]]
		-- text width/length limit (80-90 Python, 120 Prettier, etc)
		ColorColumn = { bg = palette.gray.v15 },
		-- current line and column highlight
		CursorLine = { bg = palette.gray.v15 },
		CursorColumn = { link = "CursorLine" },

		--[[ GUTTER ]]
		-- line numbers : all | current | above/below current
		LineNr = { fg = palette.gray.v40 },
		CursorLineNr = { fg = palette.gray.v60 },
		LineNrAbove = { link = "LineNr" },
		LineNrBelow = { link = "LineNr" },
		-- sign column (git, lsp, etc) : all | current
		SignColumn = { link = "LineNr" },
		CursorLineSign = { link = "CursorLineNr" },
		-- fold indicator
		CursorLineFold = { link = "CursorLineNr" },

		--[[ SEARCH ]]
		-- highlighted search results
		Search = { bg = palette.gray.v15 },
		-- currently selected search result
		CurSearch = { bg = palette.gray.v20 },
		-- dynamically shown search/substitution
		IncSearch = { link = "CurSearch" },
		Substitute = { link = "CurSearch" },
		-- matching parentheses
		MatchParen = { bg = palette.gray.v20 },

		--[[ COMPLETION ]]
		-- completion matches in insert mode
		ComplMatchIns = { fg = palette.gray.v40 },
		-- highlighted snippet inserts
		SnippetTabstop = { bg = palette.gray.v20 },

		--[[ MESSAGES ]]
		-- command line
		MsgArea = { fg = palette.gray.v70 },
		-- mode indicator (--INSERT--)
		ModeMsg = { fg = palette.gray.v70 },
		-- error and warning messages
		ErrorMsg = { fg = palette.red.v70 },
		WarningMsg = { fg = palette.yellow.v70 },
		-- input and "more" prompts
		Question = { fg = palette.cyan.v70 },
		MoreMsg = { fg = palette.cyan.v70 },
		-- separator between multiple messages
		MsgSeparator = { fg = palette.gray.v20 }, -- test

		--[[ SPECIAL ]]
		-- current quickfix entry, combines with current line highlight
		QuickFixLine = {},
		-- directory names in different listings
		Directory = { fg = palette.green.v60 },
		-- titles in output (help files, quickfix, checkhealth, etc)
		Title = { fg = palette.green.v70, bold = true },
		-- placeholders for concealed text (Markdown link "^1", etc)
		Conceal = { fg = palette.gray.v40 },
		-- non-text characters (line wrap markers, etc)
		NonText = { fg = palette.gray.v20 },
		-- end-of-buffer "~"
		EndOfBuffer = { fg = palette.gray.v10 },
		-- listchars: trailing, tabs, spaces, etc
		Whitespace = { link = "NonText" },
		-- special characters, but not listchars
		-- presumably similar to terminal escape sequences
		-- things like "^I", "[RO]", etc
		SpecialKey = { link = "NonText" },

		--[[ FLOATING WINDOWS ]]
		-- general style of floating windows
		NormalFloat = { fg = palette.gray.v80, bg = palette.gray.v10 },
		FloatBorder = { fg = palette.gray.v40 },
		-- these are displayed cutting the border
		FloatTitle = { fg = palette.gray.v60, bold = true },
		FloatFooter = { fg = palette.gray.v60 },

		--[[ POPUP MENUS ]]
		-- the menu
		Pmenu = { fg = palette.gray.v80, bg = palette.gray.v20 },
		PmenuSel = { fg = palette.gray.v80, bg = palette.gray.v25 },
		-- type of item or other subtext
		PmenuKind = { fg = palette.gray.v40 },
		PmenuKindSel = { link = "PmenuKind" },
		-- more text of the item
		PmenuExtra = { fg = palette.gray.v60 },
		PmenuExtraSel = { link = "PmenuExtra" },
		-- scrollbar
		PmenuSbar = { bg = "NONE" },
		PmenuThumb = { bg = palette.gray.v30 },
		-- matching text (like [func]tion as a suggestion for "func")
		PmenuMatch = { bold = true },
		PmenuMatchSel = { link = "PmenuMatch" },
		-- similar to popup but for simpler completions within command line
		WildMenu = { link = "PmenuSel" },

		--[[ FOLDING ]]
		Folded = { bg = palette.gray.v05 },
		FoldColumn = { link = "NonText" }, -- test

		--[[ DIFFS ]]
		DiffAdd = { bg = palette.green.v15 },
		DiffChange = { bg = palette.yellow.v15 },
		DiffDelete = { bg = palette.red.v15 },
		-- changed text within DiffChange
		DiffText = { italic = true },

		--[[ SELECTION ]]
		Visual = { bg = palette.gray.v20 },
		VisualNOS = { bg = palette.gray.v20 },

		--[[ SPELLING ]]
		-- misspelled words
		SpellBad = { underdashed = true, sp = palette.gray.v30 },
		-- capitalization errors
		SpellCap = { underdashed = true, sp = palette.gray.v30 },
		-- dialect and rare words
		SpellLocal = { underdotted = true, sp = palette.gray.v30 },
		SpellRare = { underdotted = true, sp = palette.gray.v30 },

		--[[ STATUS LINE ]]
		-- the status line at the bottom of the window, above the command line
		StatusLine = { fg = palette.gray.v10, bg = palette.gray.v80, bold = true },
		StatusLineNC = { fg = palette.gray.v80, bg = palette.gray.v30 },
		-- same but for terminal windows
		StatusLineTerm = { link = "StatusLine" },
		StatusLineTermNC = { link = "StatusLineNC" },

		--[[ TAB LINE ]]
		-- regular tabs
		TabLine = { link = "StatusLineNC" },
		-- empty space within the tab line
		TabLineFill = { link = "TabLine" },
		-- selected tab
		TabLineSel = { link = "StatusLine" },

		--[[ WINDOW BAR ]]
		-- that's essentially the name of the file below the tabline, above the buffer
		WinBar = { fg = palette.gray.v60, bold = true, italic = true },
		WinBarNC = { link = "WinBar" },
	}

	for key, value in pairs(groups) do
		vim.api.nvim_set_hl(0, key, value)
	end
end

return M
