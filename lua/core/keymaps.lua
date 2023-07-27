vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")

-- ---------- Visual Mode ---------- ---
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- Normal Mode---------- ---
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

keymap.set("n", "<leader>Q", ":qa!<CR>")

-- ---------- Edit Nvim Config------ ---

keymap.set("n", "<leader>ve", ":e ~/.config/nvim/init.lua<CR>")
keymap.set("n", "<leader>vk", ":e ~/.config/nvim/lua/core/keymaps.lua<CR>")
keymap.set("n", "<leader>vs", ":source ~/.config/nvim/init.lua<CR>")
--
--
-- ---------- Plugins ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>",{ silent = true})