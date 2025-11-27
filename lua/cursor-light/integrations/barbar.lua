local colors = require("cursor-light.colors").palette

local M = {}

-- Barbar configuration matching Cursor tabs
M.config = {
	-- Animation
	animation = false,
	
	-- Auto-hide tab bar when only one buffer
	auto_hide = false,
	
	-- Enable clickable tabs
	clickable = true,
	
	-- Exclude filetypes
	exclude_ft = {},
	exclude_name = {},
	
	-- Tab icons (matching Cursor's minimal design)
	icons = {
		-- Disable buffer indices and numbers
		buffer_index = false,
		buffer_number = false,
		-- Close button (× has a space added automatically by barbar)
		button = "×",
		-- Disable diagnostics indicators for cleaner look
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = false },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = false },
		},
		-- Disable git status indicators
		gitsigns = {
			added = { enabled = false },
			changed = { enabled = false },
			deleted = { enabled = false },
		},
		-- Enable filetype icons like in Cursor
		filetype = {
			enabled = true,
			custom_colors = false,
		},
		-- No visual separators between tabs
		separator = { left = "", right = "" },
		separator_at_end = false,
		-- Modified indicator
		modified = { button = "●" },
		-- Pinned buffer settings
		pinned = { button = "", filename = true, separator = { right = "" } },
		-- Use default preset (not powerline/slanted)
		preset = "default",
		-- Per-state overrides
		alternate = { filetype = { enabled = false } },
		current = { buffer_index = false },
		inactive = { separator = { left = "", right = "" } },
		visible = { modified = { buffer_number = false } },
	},
	
	-- Insert at start/end
	insert_at_end = false,
	insert_at_start = false,
	
	-- Minimal padding matching Cursor (1 space on each side = 2 chars total)
	-- Note: barbar multiplies padding by 2 (left + right side)
	maximum_padding = 1,
	minimum_padding = 1,
	
	-- Maximum buffer name length
	maximum_length = 30,
	
	-- Minimum buffer name length  
	minimum_length = 0,
	
	-- Semantic letters
	semantic_letters = true,
	
	-- Sidebar
	sidebar_filetypes = {
		NvimTree = true,
	},
	
	-- Tab labels
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
	
	-- No name title
	no_name_title = nil,
}

function M.setup()
	-- Apply barbar configuration
	if vim.g.loaded_barbar then
		require("barbar").setup(M.config)
	end

	local highlights = {
		-- Current/visible buffer (активная вкладка)
		BufferCurrent = { fg = colors.fg, bg = colors.bg },
		BufferCurrentIndex = { fg = colors.fg_dark, bg = colors.bg },
		BufferCurrentMod = { fg = colors.orange, bg = colors.bg },
		BufferCurrentSign = { fg = colors.bg, bg = colors.bg },
		BufferCurrentTarget = { fg = colors.red, bg = colors.bg, bold = true },
		BufferCurrentIcon = { fg = colors.fg, bg = colors.bg },

		-- Visible but not current buffer (видимая, но не активная)
		BufferVisible = { fg = colors.fg_dark, bg = colors.bg_sidebar },
		BufferVisibleIndex = { fg = colors.fg_darker, bg = colors.bg_sidebar },
		BufferVisibleMod = { fg = colors.orange, bg = colors.bg_sidebar },
		BufferVisibleSign = { fg = colors.bg_sidebar, bg = colors.bg_sidebar },
		BufferVisibleTarget = { fg = colors.red, bg = colors.bg_sidebar, bold = true },
		BufferVisibleIcon = { fg = colors.fg_dark, bg = colors.bg_sidebar },

		-- Inactive buffer (неактивная вкладка)
		BufferInactive = { fg = colors.fg_dark, bg = colors.bg_sidebar },
		BufferInactiveIndex = { fg = colors.fg_darker, bg = colors.bg_sidebar },
		BufferInactiveMod = { fg = colors.yellow, bg = colors.bg_sidebar },
		BufferInactiveSign = { fg = colors.bg_sidebar, bg = colors.bg_sidebar },
		BufferInactiveTarget = { fg = colors.red, bg = colors.bg_sidebar, bold = true },
		BufferInactiveIcon = { fg = colors.fg_darker, bg = colors.bg_sidebar },

		-- Табы
		BufferTabpages = { fg = colors.fg_dark, bg = colors.bg_sidebar, bold = true },
		BufferTabpageFill = { fg = colors.none, bg = colors.bg_sidebar },

		-- Кнопка закрытия
		BufferCurrentButton = { fg = colors.fg_dark, bg = colors.bg },
		BufferVisibleButton = { fg = colors.fg_darker, bg = colors.bg_sidebar },
		BufferInactiveButton = { fg = colors.fg_darker, bg = colors.bg_sidebar },

		-- Разделитель
		BufferOffset = { fg = colors.fg_dark, bg = colors.bg_sidebar },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

return M
