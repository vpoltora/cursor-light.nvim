# cursor-light.nvim

A clean and elegant light theme for Neovim, inspired by Cursor IDE's light theme. Features carefully crafted colors for optimal readability and a modern development experience.

## ✨ Features

- 🎨 Beautiful light color scheme matching Cursor IDE
- 📐 Custom statuscolumn with line numbers and separator (matching Cursor's layout)
- 🔍 LSP Saga breadcrumbs integration with themed highlights
- 🌲 nvim-tree integration with proper styling
- 🎯 Comprehensive syntax highlighting for Treesitter and LSP
- ⚡ Optimized for Go, JavaScript/TypeScript, Python, Dart, and more

## 📸 Screenshots

The theme provides:
- Clean white background (#FCFCFC)
- Centered line numbers with vertical separator
- Color-coded breadcrumbs in the winbar
- Consistent styling across all UI elements

## 📦 Installation

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'yourusername/cursor-light.nvim'
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use 'yourusername/cursor-light.nvim'
```

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'yourusername/cursor-light.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('cursor-light').setup()
    vim.cmd.colorscheme('cursor-light')
  end,
}
```

## 🚀 Usage

### Basic Setup

The simplest way to use the theme:

```lua
-- Load the colorscheme
vim.cmd.colorscheme('cursor-light')
```

Or with explicit setup:

```lua
require('cursor-light').setup()
vim.cmd.colorscheme('cursor-light')
```

### Advanced Setup

You can customize which features to enable:

```lua
require('cursor-light').setup({
  ui = true,  -- Enable UI customizations (statuscolumn, line numbers, etc.)
  integrations = {
    lspsaga = true,    -- Enable lspsaga breadcrumbs theming
    nvim_tree = true,  -- Enable nvim-tree styling
  },
})
```

### Plugin Integrations

#### LSP Saga Configuration

The theme provides custom configuration for lspsaga. You can merge it with your settings:

```lua
local cursor_light = require('cursor-light')

require('lspsaga').setup(
  vim.tbl_deep_extend('force', 
    cursor_light.lspsaga_config(),
    {
      -- Your custom lspsaga settings here
      lightbulb = {
        enable = true,
        sign = false,
        virtual_text = true
      },
    }
  )
)
```

#### nvim-tree Configuration

Similarly for nvim-tree:

```lua
local cursor_light = require('cursor-light')

require('nvim-tree').setup(
  vim.tbl_deep_extend('force',
    cursor_light.nvim_tree_config(),
    {
      -- Your custom nvim-tree settings here
      sort = {
        sorter = "case_sensitive",
      },
    }
  )
)
```

## 🎨 Color Palette

The theme uses a carefully selected color palette:

| Element | Color | Hex |
|---------|-------|-----|
| Background | White | `#FCFCFC` |
| Foreground | Dark Gray | `#141414` |
| Keywords | Red | `#B3003F` |
| Functions | Orange | `#DB704B` |
| Strings | Purple | `#9E94D5` |
| Types | Blue | `#206595` |
| Comments | Gray | `#555555` |
| Constants | Blue | `#206595` |

## 🔧 Requirements

- Neovim >= 0.8.0
- Treesitter (recommended for better syntax highlighting)
- A terminal that supports true colors

## 📚 Recommended Setup

For the best experience, use with these plugins:

- `nvim-treesitter/nvim-treesitter` - Enhanced syntax highlighting
- `nvimdev/lspsaga.nvim` - Beautiful breadcrumbs in winbar
- `kyazdani42/nvim-tree.lua` - File explorer with themed styling

## 🤝 Contributing

Contributions are welcome! Feel free to:

- Report bugs
- Suggest new features
- Submit pull requests
- Improve documentation

## 📄 License

MIT License - feel free to use this theme in your projects!

## 🙏 Credits

Inspired by [Cursor IDE](https://cursor.sh/)'s light theme.

## 💡 Tips

- Use with the JetBrains Mono font (size 13) for the authentic Cursor experience
- The theme works best with a terminal that supports italics
- Enable `termguicolors` in your Neovim config: `vim.opt.termguicolors = true`
