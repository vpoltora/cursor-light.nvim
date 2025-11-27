local colors = require("cursor-light.colors").palette

local M = {}

function M.setup()
	-- Force disable statuscolumn for NvimTree buffers
	vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
		pattern = { "NvimTree", "*" },
		callback = function()
			if vim.bo.filetype == "NvimTree" then
				vim.wo.statuscolumn = ""
				vim.wo.number = false
				vim.wo.relativenumber = false
				vim.wo.signcolumn = "no"
				vim.wo.foldcolumn = "1"
			end
		end,
	})
	
	-- Highlight groups matching Cursor/VS Code
	local highlights = {
		-- Background and base colors
		NvimTreeNormal = { fg = colors.fg, bg = colors.bg_sidebar },
		NvimTreeNormalNC = { fg = colors.fg, bg = colors.bg_sidebar },
		NvimTreeEndOfBuffer = { fg = colors.bg_sidebar, bg = colors.bg_sidebar },
		NvimTreeWinSeparator = { fg = colors.border, bg = colors.bg_sidebar },
		NvimTreeSignColumn = { bg = colors.bg_sidebar },
		NvimTreeStatusLine = { fg = colors.fg_dark, bg = colors.bg_sidebar },
		NvimTreeStatusLineNC = { fg = colors.fg_dark, bg = colors.bg_sidebar },
		
		-- Cursor line (selected item)
		NvimTreeCursorLine = { bg = colors.selection_inactive },
		NvimTreeCursorLineNr = { bg = colors.selection_inactive },
		
		-- Folders
		NvimTreeFolderName = { fg = colors.fg },
		NvimTreeOpenedFolderName = { fg = colors.fg },
		NvimTreeEmptyFolderName = { fg = colors.fg },
		NvimTreeSymlinkFolderName = { fg = colors.cyan },
		
		-- Folder icons (no folder icons in Cursor, only arrows)
		NvimTreeFolderIcon = { fg = colors.none, bg = colors.none },
		NvimTreeOpenedFolderIcon = { fg = colors.none, bg = colors.none },
		NvimTreeClosedFolderIcon = { fg = colors.none, bg = colors.none },
		
		-- Folder arrows (matching Cursor)
		NvimTreeFolderArrowClosed = { fg = colors.fg_dark },
		NvimTreeFolderArrowOpen = { fg = colors.fg_dark },
		
		-- Files
		NvimTreeFileIcon = { fg = colors.fg },
		NvimTreeExecFile = { fg = colors.fg },
		NvimTreeImageFile = { fg = colors.fg },
		NvimTreeSpecialFile = { fg = colors.fg },
		NvimTreeSymlink = { fg = colors.cyan },
		NvimTreeSymlinkIcon = { fg = colors.cyan },
		
		-- Root folder
		NvimTreeRootFolder = { fg = colors.fg_dark, bold = false },
		
		-- Git status icons (matching Cursor colors)
		NvimTreeGitNewIcon = { fg = colors.git_add },
		NvimTreeGitDirtyIcon = { fg = colors.git_change },
		NvimTreeGitDeletedIcon = { fg = colors.git_delete },
		NvimTreeGitMergeIcon = { fg = colors.orange },
		NvimTreeGitRenamedIcon = { fg = colors.git_change },
		NvimTreeGitStagedIcon = { fg = colors.git_add },
		NvimTreeGitIgnoredIcon = { fg = colors.git_ignored },
		
		-- Git status highlights for filenames
		NvimTreeGitFileNewHL = { fg = colors.git_add },
		NvimTreeGitFileDirtyHL = { fg = colors.git_change },
		NvimTreeGitFileDeletedHL = { fg = colors.git_delete },
		NvimTreeGitFileMergeHL = { fg = colors.orange },
		NvimTreeGitFileRenamedHL = { fg = colors.git_change },
		NvimTreeGitFileStagedHL = { fg = colors.git_add },
		NvimTreeGitFileIgnoredHL = { fg = colors.git_ignored },
		
		-- Git status for folders
		NvimTreeGitFolderNewHL = { fg = colors.git_add },
		NvimTreeGitFolderDirtyHL = { fg = colors.git_change },
		NvimTreeGitFolderDeletedHL = { fg = colors.git_delete },
		NvimTreeGitFolderMergeHL = { fg = colors.orange },
		NvimTreeGitFolderRenamedHL = { fg = colors.git_change },
		NvimTreeGitFolderStagedHL = { fg = colors.git_add },
		NvimTreeGitFolderIgnoredHL = { fg = colors.git_ignored },
		
		-- Modified files
		NvimTreeModifiedIcon = { fg = colors.orange },
		NvimTreeModifiedFileHL = { fg = colors.orange },
		NvimTreeModifiedFolderHL = { fg = colors.orange },
		
		-- Opened files
		NvimTreeOpenedHL = { fg = colors.fg, bold = false },
		
		-- Indent markers
		NvimTreeIndentMarker = { fg = colors.border },
		
		-- Bookmarks
		NvimTreeBookmarkIcon = { fg = colors.blue },
		NvimTreeBookmarkHL = { fg = colors.blue },
		
		-- Copy/Cut
		NvimTreeCopiedHL = { fg = colors.green },
		NvimTreeCutHL = { fg = colors.red },
		
		-- Window picker
		NvimTreeWindowPicker = { fg = colors.bg, bg = colors.blue, bold = true },
		
		-- Live filter
		NvimTreeLiveFilterPrefix = { fg = colors.orange },
		NvimTreeLiveFilterValue = { fg = colors.fg, bold = true },
	}
	
	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

-- Configuration for nvim-tree plugin matching Cursor/VS Code
M.config = {
	-- Disable netrw
	disable_netrw = true,
	hijack_netrw = true,
	
	-- View settings
	view = {
		width = 25, -- Cursor default sidebar width (~170-190px measured from screenshot)
		side = "left",
		number = false,
		relativenumber = false,
		signcolumn = "no",
	},
	
	-- Renderer settings (matching Cursor appearance)
	renderer = {
		-- Group empty folders
		group_empty = true,
		
		-- Indentation width (matching Cursor: ~16px per level ≈ 2 chars)
		indent_width = 2,
		
		-- No indent markers (Cursor doesn't show them)
		indent_markers = {
			enable = false,
		},
		
		-- Root folder label
		root_folder_label = ":~:s?$?/..?",
		
		-- Highlight git changes on filenames
		highlight_git = "name",
		
		-- Highlight modified files
		highlight_modified = "name",
		
		-- Highlight opened files
		highlight_opened_files = "none",
		
		-- Icons configuration
		icons = {
			web_devicons = {
				file = {
					enable = true,
					color = true,
				},
				folder = {
					enable = false, -- No folder icons in Cursor, only arrows
					color = false,
				},
			},
			git_placement = "before",
			modified_placement = "after",
			padding = " ", -- Single space between icon and text
			symlink_arrow = " → ",
			show = {
				file = true,
				folder = false, -- Hide folder icons
				folder_arrow = true, -- Show arrows for expand/collapse
				git = true,
				modified = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				bookmark = "󰆤",
				modified = "●",
				folder = {
					-- Arrows matching Cursor (▸ collapsed, ▾ expanded)
					arrow_closed = "▸",
					arrow_open = "▾",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		
		-- Special files
		special_files = {
			"Cargo.toml",
			"Makefile",
			"README.md",
			"readme.md",
			"package.json",
		},
	},
	
	-- Git integration
	git = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
		timeout = 400,
	},
	
	-- Modified files
	modified = {
		enable = true,
		show_on_dirs = true,
		show_on_open_dirs = true,
	},
	
	-- Filters
	filters = {
		dotfiles = false,
		git_ignored = false,
		custom = { "^.git$" },
	},
	
	-- Actions
	actions = {
		open_file = {
			quit_on_open = false,
			window_picker = {
				enable = true,
			},
		},
	},
	
	-- Sort
	sort = {
		sorter = "case_sensitive",
		folders_first = true,
	},
}

return M
