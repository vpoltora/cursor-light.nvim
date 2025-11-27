# cursor-light.nvim

**A clean, elegant light theme for Neovim inspired by Cursor IDE**

## 📦 Quick Start

### Installation with vim-plug

Add to your `init.vim` or `init.lua`:

```lua
Plug 'yourusername/cursor-light.nvim'
```

Then in your config:

```lua
require('cursor-light').setup()
vim.cmd.colorscheme('cursor-light')
```

### Installation with lazy.nvim

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

## ✨ What's Included

This theme provides:

1. **Color Scheme** - Beautiful light theme matching Cursor IDE
2. **Custom Line Numbers** - Centered line numbers with vertical separator
3. **LSP Saga Integration** - Themed breadcrumbs in the winbar
4. **nvim-tree Integration** - Properly styled file explorer

## 🎨 Features

- Clean white background (#FCFCFC)
- Carefully selected syntax colors
- Full Treesitter support
- LSP semantic token highlighting
- Git diff and diagnostic colors
- Custom statuscolumn with separator line

## 📝 Configuration

### Basic (Recommended)

```lua
require('cursor-light').setup()
vim.cmd.colorscheme('cursor-light')
```

### Advanced

```lua
require('cursor-light').setup({
  ui = true,  -- Enable UI customizations (statuscolumn, etc.)
  integrations = {
    lspsaga = true,    -- Apply lspsaga breadcrumb theming
    nvim_tree = true,  -- Apply nvim-tree styling
  },
})
```

### Plugin Integration

#### With LSP Saga

```lua
local cursor_light = require('cursor-light')

require('lspsaga').setup(
  vim.tbl_deep_extend('force',
    cursor_light.lspsaga_config(),
    {
      -- Your custom settings
    }
  )
)
```

#### With nvim-tree

```lua
local cursor_light = require('cursor-light')

require('nvim-tree').setup(
  vim.tbl_deep_extend('force',
    cursor_light.nvim_tree_config(),
    {
      -- Your custom settings
    }
  )
)
```

## 🎯 Best Practices

1. Load the theme early in your config
2. Use with JetBrains Mono font (size 13) for authentic Cursor look
3. Enable `termguicolors`: `vim.opt.termguicolors = true`
4. Install Treesitter for better syntax highlighting

## 🔧 Requirements

- Neovim >= 0.8.0
- Terminal with true color support
- (Optional) nvim-treesitter
- (Optional) lspsaga.nvim
- (Optional) nvim-tree.lua

## 📸 Preview

The theme provides:
- Centered line numbers with subtle vertical separator
- Color-coded breadcrumbs showing file path and symbols
- Clean, distraction-free interface
- Optimized for long coding sessions

## 🤝 Contributing

Issues and pull requests are welcome!

## 📄 License

MIT License - See LICENSE file

## 💡 Tips

- The statuscolumn format: `sign | line_number | separator | content`
- Breadcrumbs colors: folders (gray), files (blue), functions (orange), types (blue)
- Works best in light environments for reduced eye strain

---

Created with ❤️ for developers who love clean, readable themes.
