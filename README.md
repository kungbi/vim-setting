# nvim config

Personal Neovim configuration based on [LazyVim](https://github.com/LazyVim/LazyVim).

## Requirements

- Neovim >= 0.9
- Git
- [Nerd Font v3](https://www.nerdfonts.com/) (for icons)
- Node.js (for LSP, Copilot)
- [luarocks](https://luarocks.org/) + magick (for image rendering)
- tmux with `allow-passthrough on` (for image rendering in tmux)

## Installation

```bash
git clone https://github.com/kungbi/vim-setting ~/.config/nvim
nvim
```

## Plugins

### Editor

| Plugin | Description |
|--------|-------------|
| [snacks.nvim](https://github.com/folke/snacks.nvim) | File explorer (`<leader>e`) and fuzzy picker |
| [oil.nvim](https://github.com/stevearc/oil.nvim) | File editing as a buffer |
| [blink.cmp](https://github.com/saghen/blink.cmp) | Completion engine |
| [multicursor.nvim](https://github.com/jake-stewart/multicursor.nvim) | Multiple cursors |
| [mini.move](https://github.com/echasnovski/mini.move) | Move lines and blocks |
| [inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim) | Incremental LSP rename preview |

### LSP / Language

| Plugin | Description |
|--------|-------------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP configuration |
| [typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim) | TypeScript/JavaScript LSP |
| [prisma.nvim](https://github.com/prisma/vim-prisma) | Prisma schema support |

### Testing

| Plugin | Description |
|--------|-------------|
| [neotest](https://github.com/nvim-neotest/neotest) + [neotest-jest](https://github.com/nvim-neotest/neotest-jest) | Test runner with Jest support |

### Git

| Plugin | Description |
|--------|-------------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git diff signs in gutter |
| [git-graph.nvim](https://github.com/isakbm/gitgraph.nvim) | Git graph viewer |

### UI

| Plugin | Description |
|--------|-------------|
| [catppuccin](https://github.com/catppuccin/nvim) | Colorscheme |
| [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens) | Search count indicator |
| [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar) | Scrollbar with search markers |
| [image.nvim](https://github.com/3rd/image.nvim) | Image rendering (kitty backend) |
| [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) | Seamless tmux/nvim pane navigation |

## Key Mappings

### File Explorer
| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer |
| `>` / `<` | Expand / shrink explorer width |

### Completion
| Key | Action |
|-----|--------|
| `<Tab>` / `<S-Tab>` | Next / prev item |
| `<C-j>` / `<C-k>` | Next / prev item |
| `<CR>` | Accept |

### Test (Neotest)
| Key | Action |
|-----|--------|
| `<leader>tt` | Run nearest test |
| `<leader>tf` | Run current file |
| `<leader>ts` | Run test suite |
| `<leader>to` | Show test output |
| `<leader>tp` | Toggle output panel |
| `<leader>tS` | Toggle summary |

### Navigation (tmux)
| Key | Action |
|-----|--------|
| `<C-h/j/k/l>` | Move between nvim/tmux panes |

## LazyVim Extras

- `ai.copilot` — GitHub Copilot
- `editor.inc-rename` — Incremental rename
- `lang.python` — Python support
- `test.core` — Neotest integration
- `util.dot` — Dotfile support
- `util.mini-hipatterns` — Highlight patterns
