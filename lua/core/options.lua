local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.showmode = false -- Dont show mode since we have a statusline
opt.autowrite = true -- Enable auto write
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.cursorline = true -- Enable highlighting of the current line

opt.wrap = false

opt.cursorline = true

opt.mouse:append("a")

opt.clipboard = "unnamedplus" -- Sync with system clipboard

opt.splitright = true
opt.splitbelow = true

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.signcolumn = "yes"
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.wrap = false -- Disable line wrap

opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
-- colorscheme

vim.cmd[[colorscheme tokyonight-night]]

vim.cmd [[ set noswapfile ]]

