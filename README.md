
A lightweight and mordern neovim configuration for my personal usage.

<img width="848" alt="image" src="https://github.com/zhaohongxuan/nvim/assets/8613196/26a60b9a-caa6-41e2-ab26-9695de968df4">

## Requirements
- Neovim >= **0.8.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- [Nerd Font](https://www.nerdfonts.com/) (for statusline or file explorer plugins  icons)

## Install 

```bash
 git clone https://github.com/zhaohongxuan/nvim ~/.config/nvim --depth 1
```

## Structure

```
~/.config/nvim (main*) » tree                                                                                                                                                     xuan@xuans
.
├── README.md
├── init.lua
├── lazy-lock.json
└── lua
    ├── core
    │   ├── autocmds.lua
    │   ├── keymaps.lua
    │   └── options.lua
    └── plugins
        ├── configs
        │   ├── alpha-nvim.lua
        │   ├── autopairs.lua
        │   ├── bufferline.lua
        │   ├── catppuccin.lua
        │   ├── cmp.lua
        │   ├── comment.lua
        │   ├── gitsigns.lua
        │   ├── hop.lua
        │   ├── lsp.lua
        │   ├── lualine.lua
        │   ├── nvim-tree.lua
        │   ├── telescope.lua
        │   └── treesitter.lua
        └── init.lua

5 directories, 20 files
```

- the `init.lua`  is the entrance of the nvim configuration
- the `plugins-setup.lua` contains all plugins init
- the `keymaps.lua` contains all keymap 


## Features

- Neovim Theme schema via [tokyonight](https://github.com/folke/tokyonight.nvim)
- Plugin management via [Lazy.nvim](https://github.com/folke/lazy.nvim).
- Code completion via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
- Auto pair via [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- Language server protocol (LSP) support via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
- Git integration via [vim-signs](https://github.com/lewis6991/gitsigns.nvim).
- Fuzzy searching via [Telescope](https://github.com/nvim-telescope/telescope.nvim).
- Snazzy buffer line via [bufferline](https://github.com/akinsho/bufferline.nvim)
- Code commenting via [vim-commentary](https://github.com/tpope/vim-commentary).
- Smarter and faster matching pair management (add, replace or delete) via [vim-sandwich](https://github.com/machakann/vim-sandwich).
- Fast buffer jump via [hop.nvim](https://github.com/phaazon/hop.nvim).
- Toggle terminal during edit session via [toggleterm](https://github.com/akinsho/toggleterm.nvim)
- Beautiful statusline via [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
- File tree explorer via [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua).
- Code highlighting via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).

## Keymaps

TBD

## Screenshots

- Performance
<img width="1037" alt="image" src="https://github.com/zhaohongxuan/nvim/assets/8613196/0af80d8e-668a-4fc2-accf-9aa36e5c4a8a">
- Usage
<img width="1283" alt="image" src="https://github.com/zhaohongxuan/nvim/assets/8613196/2763f951-1a9b-4d6a-9bf2-f1b36e233093">
