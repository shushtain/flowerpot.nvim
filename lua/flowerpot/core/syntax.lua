local M = {}

function M.setup(palette)
	local groups = {
		Comment = { link = "@comment" },
		Constant = { link = "@constant" },
		String = { link = "@string" },
		Character = { link = "@character" },
		Number = { link = "@number" },
		Boolean = { link = "@boolean" },
		Float = { link = "@number.float" },

		Identifier = { link = "@property" },
		Function = { link = "@function" },

		Statement = { link = "@label" },
		Conditional = { link = "@keyword.conditional" },
		Repeat = { link = "@keyword.repeat" },
		Label = { link = "@keyword.conditional" },
		Operator = { link = "@operator" },
		Keyword = { link = "@keyword" },
		Exception = { link = "@keyword.exception" },

		PreProc = { link = "@keyword.directive" },
		Include = { link = "@keyword.import" },
		Define = { link = "@keyword.directive.define" },
		Macro = { link = "@function.macro" },
		PreCondit = { link = "@keyword.directive" },

		Type = { link = "@module" },
		StorageClass = { link = "@keyword.modifier" },
		Structure = { link = "@type" },
		Typedef = { link = "@type.definition" },

		Special = { link = "@punctuation.special" },
		SpecialChar = { link = "@string.escape" },
		Tag = { link = "@label" },
		Delimiter = { link = "@punctuation.delimiter" },
		SpecialComment = { link = "@comment.documentation" },
		Debug = { link = "@keyword.debug" },

		Underlined = { link = "@string.special.url" },

		Ignore = { bg = palette.gray.v05 },
		Error = { fg = palette.red.v60 },

		Todo = { link = "@comment.todo" },

		Added = { fg = palette.green.v70 },
		Changed = { fg = palette.yellow.v70 },
		Removed = { fg = palette.red.v70 },

		DiagnosticError = { fg = palette.red.v60 },
		DiagnosticVirtualTextError = { fg = palette.red.v40 },
		DiagnosticUnderlineError = { undercurl = true, sp = palette.red.v60 },
		DiagnosticFloatingError = { link = "DiagnosticError" },
		DiagnosticSignError = { fg = palette.red.v40 },

		DiagnosticWarn = { fg = palette.yellow.v60 },
		DiagnosticVirtualTextWarn = { fg = palette.yellow.v40 },
		DiagnosticUnderlineWarn = { undercurl = true, sp = palette.yellow.v60 },
		DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
		DiagnosticSignWarn = { fg = palette.yellow.v40 },

		DiagnosticInfo = { fg = palette.blue.v60 },
		DiagnosticVirtualTextInfo = { fg = palette.blue.v40 },
		DiagnosticUnderlineInfo = { undercurl = true, sp = palette.blue.v60 },
		DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
		DiagnosticSignInfo = { fg = palette.blue.v40 },

		DiagnosticHint = { fg = palette.gray.v60 },
		DiagnosticVirtualTextHint = { fg = palette.gray.v40 },
		DiagnosticUnderlineHint = { undercurl = true, sp = palette.gray.v60 },
		DiagnosticFloatingHint = { link = "DiagnosticHint" },
		DiagnosticSignHint = { fg = palette.gray.v40 },

		DiagnosticOk = { fg = palette.green.v60 },
		DiagnosticVirtualTextOk = { fg = palette.green.v40 },
		DiagnosticUnderlineOk = { undercurl = true, sp = palette.green.v60 },
		DiagnosticFloatingOk = { link = "DiagnosticOk" },
		DiagnosticSignOk = { fg = palette.green.v40 },

		DiagnosticDeprecated = { strikethrough = true },
		DiagnosticUnnecessary = { fg = palette.gray.v40, italic = true },

		["@variable"] = { fg = palette.green.v80 },
		["@variable.builtin"] = { link = "@variable", bold = true },
		["@variable.parameter"] = { link = "@variable" },
		["@variable.parameter.builtin"] = { link = "@variable.builtin" },
		["@variable.member"] = { link = "@variable" },

		["@constant"] = { fg = palette.green.v60 },
		["@constant.builtin"] = { link = "@boolean" },
		["@constant.macro"] = { link = "@constant" },

		["@module"] = { fg = palette.green.v70 },
		["@module.builtin"] = { link = "@module" },
		["@label"] = { link = "@constant" },

		["@string"] = { fg = palette.yellow.v70 },
		["@string.documentation"] = { link = "@string" },
		["@string.regexp"] = { link = "@string.special" },
		["@string.escape"] = { fg = palette.yellow.v50 },
		["@string.special"] = { fg = palette.yellow.v80 },
		["@string.special.symbol"] = { link = "@string.special" },
		["@string.special.path"] = { link = "@string.special" },
		["@string.special.url"] = { link = "@string.special", underline = true },

		["@character"] = { link = "@string" },
		["@character.special"] = { link = "@string.special" },

		["@boolean"] = { fg = palette.yellow.v85 },
		["@number"] = { fg = palette.yellow.v85 },
		["@number.float"] = { link = "@number" },

		["@type"] = { fg = palette.green.v60 },
		["@type.builtin"] = { link = "@type" },
		["@type.definition"] = { link = "@type" },

		["@attribute"] = { fg = palette.green.v60 },
		["@attribute.builtin"] = { link = "@attribute" },
		["@property"] = { link = "@variable" },

		["@function"] = { fg = palette.red.v80 },
		["@function.builtin"] = { link = "@function" },
		["@function.call"] = { link = "@function" },
		["@function.macro"] = { link = "@function" },

		["@function.method"] = { link = "@function" },
		["@function.method.call"] = { link = "@function" },

		["@constructor"] = { link = "@function" },
		["@operator"] = { fg = palette.gray.v60 },

		["@keyword"] = { fg = palette.green.v50 },
		["@keyword.coroutine"] = { link = "@keyword" },
		["@keyword.function"] = { link = "@keyword" },
		["@keyword.operator"] = { link = "@keyword" },
		["@keyword.import"] = { link = "@keyword" },
		["@keyword.type"] = { link = "@keyword" },
		["@keyword.modifier"] = { link = "@keyword" },
		["@keyword.repeat"] = { link = "@keyword" },
		["@keyword.return"] = { link = "@keyword" },
		["@keyword.debug"] = { link = "@keyword" },
		["@keyword.exception"] = { link = "@keyword" },

		["@keyword.conditional"] = { link = "@keyword" },
		["@keyword.conditional.ternary"] = { link = "@operator" },

		["@keyword.directive"] = { link = "@keyword" },
		["@keyword.directive.define"] = { link = "@keyword" },

		["@punctuation.delimiter"] = { fg = palette.gray.v50 },
		["@punctuation.bracket"] = { link = "@punctuation.delimiter" },
		["@punctuation.special"] = { fg = palette.green.v60 },

		["@comment"] = { fg = palette.gray.v40 },
		["@comment.documentation"] = { fg = palette.gray.v60 },

		["@comment.error"] = { fg = palette.red.v60 },
		["@comment.warning"] = { fg = palette.yellow.v60 },
		["@comment.todo"] = { fg = palette.cyan.v60, bold = true },
		["@comment.note"] = { fg = palette.blue.v60 },

		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.underline"] = { underline = true },

		["@markup.heading"] = { bold = true, fg = palette.green.v70 },

		["@markup.quote"] = { fg = palette.green.v60 },
		["@markup.math"] = { fg = palette.yellow.v70 },

		["@markup.link"] = { underline = true, fg = palette.green.v60 },
		["@markup.link.label"] = { link = "@markup.link" },
		["@markup.link.url"] = { link = "@markup.link" },

		["@markup.raw"] = { fg = palette.gray.v60 },
		["@markup.raw.block"] = { fg = palette.gray.v70 },

		["@markup.list"] = { fg = palette.green.v60 },
		["@markup.list.checked"] = { fg = palette.green.v70 },
		["@markup.list.unchecked"] = { fg = palette.green.v60 },

		["@diff.plus"] = { link = "Added" },
		["@diff.minus"] = { link = "Removed" },
		["@diff.delta"] = { link = "Changed" },

		["@tag"] = { link = "@constant" },
		["@tag.builtin"] = { link = "@constant" },
		["@tag.attribute"] = { link = "@variable" },
		["@tag.delimiter"] = { link = "@punctuation.delimiter" },

		["@conceal"] = { link = "Conceal" },
		["@error"] = { link = "Error" },

		["@lsp.type.boolean"] = { link = "@boolean" },
		["@lsp.type.builtinType"] = { link = "@type.builtin" },
		["@lsp.type.comment"] = { link = "@comment" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.escapeSequence"] = { link = "@string.escape" },
		["@lsp.type.formatSpecifier"] = { link = "@string.special" },
		["@lsp.type.interface"] = { link = "@attribute" },
		["@lsp.type.keyword"] = { link = "@keyword" },
		["@lsp.type.namespace"] = { link = "@module" },
		["@lsp.type.number"] = { link = "@number" },
		["@lsp.type.operator"] = { link = "@operator" },
		["@lsp.type.parameter"] = { link = "@variable.parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.typeAlias"] = { link = "@type.definition" },
		["@lsp.type.unresolvedReference"] = { link = "@error" },
		["@lsp.type.variable"] = {},
		["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
		["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"] = { link = "@operator" },
		["@lsp.typemod.string.injected"] = { link = "@string" },
		["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"] = { link = "@variable" },

		GlyphPalette0 = { fg = palette.gray.v30 },
		GlyphPalette1 = { fg = palette.red.v60 },
		GlyphPalette2 = { fg = palette.green.v60 },
		GlyphPalette3 = { fg = palette.yellow.v60 },
		GlyphPalette4 = { fg = palette.blue.v60 },
		GlyphPalette5 = { fg = palette.magenta.v60 },
		GlyphPalette6 = { fg = palette.cyan.v60 },
		GlyphPalette7 = { fg = palette.gray.v80 },
		GlyphPalette8 = { fg = palette.gray.v40 },
		GlyphPalette9 = { fg = palette.red.v70 },
		GlyphPalette10 = { fg = palette.green.v70 },
		GlyphPalette11 = { fg = palette.yellow.v70 },
		GlyphPalette12 = { fg = palette.blue.v70 },
		GlyphPalette13 = { fg = palette.magenta.v70 },
		GlyphPalette14 = { fg = palette.cyan.v70 },
		GlyphPalette15 = { fg = palette.gray.v90 },

		healthError = { fg = palette.red.v60 },
		healthSuccess = { fg = palette.green.v60 },
		healthWarning = { fg = palette.yellow.v60 },

		qfLineNr = { link = "LineNr" },
		qfFileName = { link = "Directory" },
	}

	for key, value in pairs(groups) do
		vim.api.nvim_set_hl(0, key, value)
	end
end

return M
