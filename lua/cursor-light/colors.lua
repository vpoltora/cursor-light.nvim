-- Color palette from Cursor Light theme v0.0.2
-- Colors approximated from Cursor's alpha-blended values (Neovim doesn't support alpha)
local M = {}

M.palette = {
	-- Main editor colors
	bg = "#FCFCFC", -- editor.background
	fg = "#141414", -- editor.foreground (from #141414EB)
	fg_dark = "#555555", -- darker foreground (from #141414AD)
	fg_darker = "#999999", -- even darker (from #1414147A)
	fg_light = "#BBBBBB", -- lighter foreground (from #1414145E)

	bg_sidebar = "#F3F3F3", -- sideBar.background
	bg_statusline = "#F3F3F3", -- statusBar.background
	bg_line = "#EDEDED", -- editor.lineHighlightBackground
	bg_float = "#F3F3F3", -- floating windows background

	-- Syntax colors (exact from Cursor)
	comment = "#6F6F6F", -- Comments (from #141414AD)
	string = "#9E94D5", -- Strings (purple)
	keyword = "#B31B3F", -- Keywords (red)
	func = "#DB704B", -- Functions (orange)
	variable = "#141414", -- Variables (from #141414EB)
	constant = "#206595", -- Constants (blue)
	number = "#B8448B", -- Numbers (magenta)
	type = "#206595", -- Types (blue)
	property = "#6049B3", -- Properties (purple-blue)
	operator = "#141414", -- Operators (from #141414EB)
	operator_keyword = "#B31B3F", -- Operator keywords

	-- Special colors
	green = "#1F8A65", -- Git added, decorators, macros
	green_bright = "#55A583", -- Brighter green
	cyan = "#4C7F8C", -- Cyan
	teal = "#6F9BA6", -- Built-in functions, booleans
	orange = "#DB704B", -- Functions, warnings, parameters
	yellow = "#C08532", -- Modified files, warnings
	yellow_dark = "#A16900", -- Darker yellow
	red = "#CF2D56", -- Errors, deleted
	red_bright = "#E75E78", -- Brighter red
	magenta = "#B8448B", -- Special keywords, self parameter
	magenta_bright = "#D06BA6", -- Brighter magenta
	purple = "#9E94D5", -- Strings
	blue = "#206595", -- Types, constants
	blue_light = "#6299C3", -- Lighter blue
	blue_bright = "#3C7CAB", -- Links, buttons, regex

	-- UI element colors (approximations of alpha-blended values)
	cursor = "#141414",
	selection = "#E8E8E8", -- approximation of #1414141E
	selection_inactive = "#F0F0F0", -- approximation of #14141411
	line_number = "#999999", -- approximation of #1414147A
	line_number_active = "#555555", -- approximation of #141414AD
	border = "#EEEEEE", -- approximation of #14141413
	border_focus = "#DDDDDD", -- approximation of #14141426
	visual = "#F0F0F0", -- approximation of #14141411
	search = "#B8CDD4", -- approximation of #6F9BA65C
	search_match = "#D4E3E8", -- approximation of #6F9BA62E

	-- Semantic element colors
	error = "#CF2D56",
	warning = "#DB704B",
	info = "#206595",
	hint = "#6F9BA6",

	-- Git decoration colors
	git_add = "#1F8A65",
	git_change = "#C08532",
	git_delete = "#CF2D56",
	git_ignored = "#999999", -- approximation of #1414147A
	git_untracked = "#4C7F8C",

	-- Diff colors (approximations)
	diff_add_bg = "#D8EDE5",
	diff_add_text_bg = "#CCE8DC",
	diff_delete_bg = "#FADFE5",
	diff_delete_text_bg = "#F5D4DC",

	-- Special UI colors
	button_bg = "#3C7CAB",
	button_hover = "#055180",
	link = "#3C7CAB",

	-- Transparent
	none = "NONE",
}

return M
