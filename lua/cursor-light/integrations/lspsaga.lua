local colors = require('cursor-light.colors').palette

local M = {}

function M.setup()
-- Custom highlight groups for breadcrumbs matching Cursor Light theme
vim.api.nvim_set_hl(0, 'WinBar', { bg = colors.bg })
vim.api.nvim_set_hl(0, 'WinBarNC', { bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarSep', { fg = colors.line_number, bg = colors.bg })

-- Folders in gray (like Cursor)
vim.api.nvim_set_hl(0, 'SagaWinbarFolder', { fg = colors.line_number, bg = colors.bg })

-- Files in blue/cyan (like Cursor)
vim.api.nvim_set_hl(0, 'SagaWinbarFile', { fg = colors.light_blue, bg = colors.bg })

-- Functions and methods in orange
vim.api.nvim_set_hl(0, 'SagaWinbarFunction', { fg = colors.func, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarMethod', { fg = colors.func, bg = colors.bg })

-- Types and structures in blue
vim.api.nvim_set_hl(0, 'SagaWinbarModule', { fg = colors.type, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarClass', { fg = colors.type, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarStruct', { fg = colors.type, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarInterface', { fg = colors.type, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarNamespace', { fg = colors.type, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarPackage', { fg = colors.type, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarEnum', { fg = colors.type, bg = colors.bg })

-- Variables and properties
vim.api.nvim_set_hl(0, 'SagaWinbarVariable', { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarProperty', { fg = colors.property, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarKey', { fg = colors.fg, bg = colors.bg })

-- Constants and other types
vim.api.nvim_set_hl(0, 'SagaWinbarConstant', { fg = colors.constant, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarArray', { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarBoolean', { fg = colors.teal, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarNumber', { fg = colors.number, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarObject', { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarString', { fg = colors.string, bg = colors.bg })
vim.api.nvim_set_hl(0, 'SagaWinbarTypeParameter', { fg = colors.type, bg = colors.bg })
end

-- Configuration for lspsaga plugin
M.config = {
symbol_in_winbar = {
enable = true,
separator = ' > ',
show_file = true,
folder_level = 2,
hide_keyword = false,
color_mode = true,
delay = 300,
},
ui = {
border = 'rounded',
winblend = 0,
devicon = false,
foldericon = false,
winbar_prefix = '',
colors = {
normal_bg = '#FCFCFC',
},
},
}

return M
