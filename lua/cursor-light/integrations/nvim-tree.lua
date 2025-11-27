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
end
end,
})
end

-- Configuration for nvim-tree plugin
M.config = {
view = {
width = 30,
number = false,
relativenumber = false,
signcolumn = "no",
},
renderer = {
group_empty = true,
indent_width = 2,
indent_markers = {
enable = false,
},
icons = {
padding = "  ",
},
},
}

return M
