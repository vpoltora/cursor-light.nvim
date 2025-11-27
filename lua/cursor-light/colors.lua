-- Color palette from Cursor Light theme
local M = {}

M.palette = {
	-- Main colors
	bg = "#FCFCFC",              -- editor.background
	fg = "#141414",              -- editor.foreground
	bg_sidebar = "#F3F3F3",      -- sideBar.background
	bg_statusline = "#F3F3F3",   -- statusBar.background
	bg_line = "#EDEDED",         -- editor.lineHighlightBackground

	-- Syntax colors
	comment = "#555555",         -- Comments (italic) - approximation of #141414AD
	string = "#9E94D5",          -- Strings (purple)
	keyword = "#B3003F",         -- Keywords (red)
	func = "#DB704B",            -- Functions (orange)
	variable = "#141414",        -- Variables
	constant = "#206595",        -- Constants (blue)
	number = "#206595",          -- Numbers (blue)
	type = "#206595",            -- Types (blue)
	property = "#6049B3",        -- Properties (purple-blue)
	operator = "#555555",        -- Operators - approximation of #141414AD

	-- Special colors
	green = "#1F8A65",           -- Git added, strings in some contexts
	cyan = "#4C7F8C",            -- Cyan
	teal = "#6F9BA6",            -- Built-in functions
	orange = "#DB704B",          -- Functions, warnings
	yellow = "#C08532",          -- Modified files
	red = "#CF2D56",             -- Errors, deleted
	magenta = "#B8448B",         -- Special keywords
	purple = "#9E94D5",          -- Strings
	blue = "#206595",            -- Types, constants
	light_blue = "#3C7CAB",      -- Links

	-- UI colors
	cursor = "#141414",
	selection = "#E8E8E8",       -- approximation of #1414141E
	line_number = "#999999",     -- approximation of #1414147A
	line_number_active = "#555555", -- approximation of #141414AD
	border = "#EEEEEE",          -- approximation of #14141413
	visual = "#F0F0F0",          -- approximation of #14141411
	search = "#B8CDD4",          -- approximation of #6F9BA65C
	error = "#CF2D56",
	warning = "#DB704B",
	info = "#206595",
	hint = "#6F9BA6",

	-- Transparent/alpha colors
	none = "NONE",
}

return M
