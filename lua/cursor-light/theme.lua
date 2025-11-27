local colors = require("cursor-light.colors").palette

local M = {}

function M.setup()
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	vim.o.background = "light"
	vim.g.colors_name = "cursor-light"

	-- Editor highlights (matching Cursor Light v0.0.2)
	local highlights = {
		-- Base
		Normal = { fg = colors.fg, bg = colors.bg },
		NormalFloat = { fg = colors.fg, bg = colors.bg_float },
		NormalNC = { fg = colors.fg, bg = colors.bg },

		-- Cursor
		Cursor = { fg = colors.bg, bg = colors.cursor },
		CursorLine = { bg = colors.bg_line },
		CursorColumn = { bg = colors.bg_line },
		CursorLineNr = { fg = colors.line_number_active, bold = true },
		LineNr = { fg = colors.line_number },

		-- Selection
		Visual = { bg = colors.selection },
		VisualNOS = { bg = colors.selection },
		Search = { bg = colors.search },
		IncSearch = { bg = colors.search, fg = colors.fg },

		-- UI Elements
		Pmenu = { fg = colors.fg_dark, bg = colors.bg_float },
		PmenuSel = { bg = colors.selection_inactive, fg = colors.fg },
		PmenuSbar = { bg = colors.border },
		PmenuThumb = { bg = colors.line_number },
		StatusLine = { fg = colors.line_number, bg = colors.bg_statusline },
		StatusLineNC = { fg = colors.line_number, bg = colors.bg_statusline },
		TabLine = { fg = colors.comment, bg = colors.bg_sidebar },
		TabLineFill = { bg = colors.bg_sidebar },
		TabLineSel = { fg = colors.fg, bg = colors.bg },
		VertSplit = { fg = colors.border },
		WinSeparator = { fg = colors.border },
		FloatBorder = { fg = colors.border },

		-- Windows and groups
		WinBar = { bg = colors.bg },
		WinBarNC = { bg = colors.bg },

		-- Syntax (Vim standard groups)
		Comment = { fg = colors.comment, italic = true },
		Constant = { fg = colors.constant },
		String = { fg = colors.string },
		Character = { fg = colors.string },
		Number = { fg = colors.number },
		Boolean = { fg = colors.teal },
		Float = { fg = colors.number },

		Identifier = { fg = colors.variable },
		Function = { fg = colors.func },

		Statement = { fg = colors.keyword },
		Conditional = { fg = colors.keyword },
		Repeat = { fg = colors.keyword },
		Label = { fg = colors.keyword },
		Operator = { fg = colors.operator },
		Keyword = { fg = colors.keyword },
		Exception = { fg = colors.keyword },

		PreProc = { fg = colors.green },
		Include = { fg = colors.keyword },
		Define = { fg = colors.green },
		Macro = { fg = colors.green },
		PreCondit = { fg = colors.green },

		Type = { fg = colors.type },
		StorageClass = { fg = colors.keyword },
		Structure = { fg = colors.type },
		Typedef = { fg = colors.type },

		Special = { fg = colors.orange },
		SpecialChar = { fg = colors.orange },
		Tag = { fg = colors.green },
		Delimiter = { fg = colors.variable },
		SpecialComment = { fg = colors.comment, italic = true },
		Debug = { fg = colors.red },

		-- Treesitter (new standard)
		["@variable"] = { fg = colors.variable },
		["@variable.builtin"] = { fg = colors.teal },
		["@variable.parameter"] = { fg = colors.orange },
		["@variable.member"] = { fg = colors.property },

		["@constant"] = { fg = colors.constant },
		["@constant.builtin"] = { fg = colors.teal },
		["@constant.macro"] = { fg = colors.green },

		["@string"] = { fg = colors.string },
		["@string.escape"] = { fg = colors.green },
		["@string.regex"] = { fg = colors.blue_bright },
		["@string.special"] = { fg = colors.keyword },

		["@character"] = { fg = colors.string },
		["@number"] = { fg = colors.number },
		["@boolean"] = { fg = colors.teal },
		["@float"] = { fg = colors.number },

		["@function"] = { fg = colors.func },
		["@function.builtin"] = { fg = colors.teal },
		["@function.macro"] = { fg = colors.green },
		["@function.method"] = { fg = colors.func },
		["@function.call"] = { fg = colors.func },

		["@constructor"] = { fg = colors.type },
		["@parameter"] = { fg = colors.orange },

		["@keyword"] = { fg = colors.keyword },
		["@keyword.function"] = { fg = colors.keyword },
		["@keyword.operator"] = { fg = colors.keyword },
		["@keyword.return"] = { fg = colors.keyword },
		["@keyword.import"] = { fg = colors.keyword, italic = true },

		["@conditional"] = { fg = colors.keyword },
		["@repeat"] = { fg = colors.keyword },
		["@label"] = { fg = colors.keyword },
		["@operator"] = { fg = colors.operator },
		["@exception"] = { fg = colors.keyword },

		["@type"] = { fg = colors.type },
		["@type.builtin"] = { fg = colors.teal },
		["@type.qualifier"] = { fg = colors.keyword },
		["@type.definition"] = { fg = colors.type },

		["@property"] = { fg = colors.property },
		["@field"] = { fg = colors.property },
		["@attribute"] = { fg = colors.property },

		["@comment"] = { fg = colors.comment, italic = true },

		["@punctuation.delimiter"] = { fg = colors.variable },
		["@punctuation.bracket"] = { fg = colors.variable },
		["@punctuation.special"] = { fg = colors.orange },

		["@tag"] = { fg = colors.green },
		["@tag.html"] = { fg = colors.type },
		["@tag.attribute"] = { fg = colors.property },
		["@tag.delimiter"] = { fg = colors.fg_dark },

		["@namespace"] = { fg = colors.type },
		["@module"] = { fg = colors.type },

		-- LSP Semantic Tokens (matching Cursor exactly)
		["@lsp.type.namespace"] = { fg = colors.type },
		["@lsp.type.type"] = { fg = colors.type },
		["@lsp.type.class"] = { fg = colors.type },
		["@lsp.type.enum"] = { fg = colors.type },
		["@lsp.type.interface"] = { fg = colors.type },
		["@lsp.type.struct"] = { fg = colors.type },
		["@lsp.type.parameter"] = { fg = colors.orange },
		["@lsp.type.variable"] = { fg = colors.variable },
		["@lsp.type.property"] = { fg = colors.property },
		["@lsp.type.enumMember"] = { fg = colors.variable },
		["@lsp.type.function"] = { fg = colors.func },
		["@lsp.type.method"] = { fg = colors.func },
		["@lsp.type.macro"] = { fg = colors.green },
		["@lsp.type.decorator"] = { fg = colors.green },
		["@lsp.type.comment"] = { fg = colors.comment, italic = true },

		-- Additional semantic tokens
		["@lsp.mod.readonly"] = { fg = colors.constant },
		["@lsp.mod.constant"] = { fg = colors.constant },
		["@lsp.mod.global"] = { fg = colors.green },
		["@lsp.typemod.variable.readonly"] = { fg = colors.constant },
		["@lsp.typemod.variable.constant"] = { fg = colors.constant },
		["@lsp.typemod.variable.defaultLibrary"] = { fg = colors.fg_dark },
		["@lsp.typemod.variable.global"] = { fg = colors.green },
		["@lsp.typemod.function.builtin"] = { fg = colors.teal },
		["@lsp.typemod.class.builtin"] = { fg = colors.teal },

		-- Language-specific (Python)
		["@lsp.typemod.parameter.self.python"] = { fg = colors.magenta },
		["@decorator.python"] = { fg = colors.green },
		["@function.call.python"] = { fg = colors.property },

		-- Language-specific (C/C++)
		["@lsp.type.variable.cpp"] = { fg = colors.variable },
		["@boolean.cpp"] = { fg = colors.teal },
		["@variable.this.cpp"] = { fg = colors.teal },

		-- Diagnostics
		DiagnosticError = { fg = colors.error },
		DiagnosticWarn = { fg = colors.warning },
		DiagnosticInfo = { fg = colors.info },
		DiagnosticHint = { fg = colors.hint },
		DiagnosticUnderlineError = { undercurl = true, sp = colors.error },
		DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warning },
		DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info },
		DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint },

		-- Git signs
		DiffAdd = { bg = colors.diff_add_bg },
		DiffChange = { bg = colors.diff_add_text_bg },
		DiffDelete = { bg = colors.diff_delete_bg },
		DiffText = { bg = colors.diff_add_text_bg },

		GitSignsAdd = { fg = colors.git_add },
		GitSignsChange = { fg = colors.git_change },
		GitSignsDelete = { fg = colors.git_delete },

		-- Gitsigns (specific)
		GitSignsCurrentLineBlame = { fg = colors.git_ignored, italic = true },

		-- Diff view
		diffAdded = { fg = colors.git_add },
		diffRemoved = { fg = colors.git_delete },
		diffChanged = { fg = colors.git_change },
		diffOldFile = { fg = colors.git_delete },
		diffNewFile = { fg = colors.git_add },
		diffFile = { fg = colors.blue },
		diffLine = { fg = colors.property },
		diffIndexLine = { fg = colors.fg_dark },

		-- Links
		Underlined = { fg = colors.link, underline = true },

		-- Misc
		ErrorMsg = { fg = colors.error },
		WarningMsg = { fg = colors.warning },
		MoreMsg = { fg = colors.info },
		Question = { fg = colors.info },
		Title = { fg = colors.blue, bold = true },
		Directory = { fg = colors.blue },
		MatchParen = { bg = colors.selection },
		Folded = { fg = colors.comment, bg = colors.bg_sidebar },
		FoldColumn = { fg = colors.comment },
		SignColumn = { bg = colors.bg },
		ColorColumn = { bg = colors.bg_line },

		-- Spell
		SpellBad = { undercurl = true, sp = colors.error },
		SpellCap = { undercurl = true, sp = colors.warning },
		SpellLocal = { undercurl = true, sp = colors.info },
		SpellRare = { undercurl = true, sp = colors.hint },

		-- Quickfix
		qfFileName = { fg = colors.blue },
		qfLineNr = { fg = colors.fg_dark },

		-- Indent guides
		IndentBlanklineChar = { fg = colors.border },
		IndentBlanklineContextChar = { fg = colors.border_focus },

		-- Whitespace
		Whitespace = { fg = colors.fg_light },
		NonText = { fg = colors.fg_light },
		SpecialKey = { fg = colors.fg_light },

		-- Wild menu
		WildMenu = { fg = colors.fg, bg = colors.selection },

		-- Markdown
		["@markup.heading"] = { fg = colors.variable, bold = true },
		["@markup.raw"] = { fg = colors.green },
		["@markup.link"] = { fg = colors.fg_dark },
		["@markup.link.url"] = { fg = colors.blue, underline = true },
		["@markup.list"] = { fg = colors.fg_dark },
		["@markup.italic"] = { italic = true },
		["@markup.strong"] = { bold = true },
		["@markup.strikethrough"] = { fg = colors.line_number, strikethrough = true },

		-- Help files
		helpCommand = { fg = colors.green },
		helpExample = { fg = colors.green },
		helpHeadline = { fg = colors.blue, bold = true },
		helpSectionDelim = { fg = colors.fg_dark },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
