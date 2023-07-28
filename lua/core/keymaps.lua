vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")

-- ---------- Visual Mode ---------- ---
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- Normal Mode---------- ---
keymap.set("n", "<leader>sv", "<C-w>v", {silent = true}) -- 水平新增窗口 
keymap.set("n", "<leader>sh", "<C-w>s",{silent = true}) -- 垂直新增窗口

keymap.set("n", "<leader>nh", ":nohl<CR>", {silent = true})

keymap.set("n", "<C-L>", ":bnext<CR>")
keymap.set("n", "<C-H>", ":bprevious<CR>")

keymap.set("n", "<leader>Q", ":qa!<CR>")

-- ---------- Edit Nvim Config------ ---

keymap.set("n", "<leader>ve", ":e ~/.config/nvim/init.lua<CR>", {silent = true})
keymap.set("n", "<leader>vk", ":e ~/.config/nvim/lua/core/keymaps.lua<CR>", {silent = true})
keymap.set("n", "<leader>vs", ":source ~/.config/nvim/init.lua<CR>", {silent = true})

-- ---------- Plugins ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>",{ silent = true})
keymap.set("n", "<leader>r", ":NvimTreeFocus<CR>",{ silent = true})

-- 设置快捷键映
keymap.set('n', 's', ':HopChar2<CR>', { noremap = true, silent = true })

keymap.set(
        'n',
        '<C-p>',
        ":lua require'telescope'.extensions.project.project{}<CR>",
        {noremap = true, silent = true}
)

    -- -- QuickFix
    -- ["]q"] = ":cnext<CR>",
    -- ["[q"] = ":cprev<CR>",
    -- ["<C-q>"] = ":call QuickFixToggle()<CR>",

    -- -- Better window movement
    -- ["<C-h>"] = "<C-w>h",
    -- ["<C-j>"] = "<C-w>j",
    -- ["<C-k>"] = "<C-w>k",
    -- ["<C-l>"] = "<C-w>l",
    --
    -- -- Resize with arrows
    -- ["<C-Up>"] = ":resize -2<CR>",
    -- ["<C-Down>"] = ":resize +2<CR>",
    -- ["<C-Left>"] = ":vertical resize -2<CR>",
    -- ["<C-Right>"] = ":vertical resize +2<CR>",
    --
    -- -- Move current line / block with Alt-j/k a la vscode.
    -- ["<A-j>"] = ":m .+1<CR>==",
    -- ["<A-k>"] = ":m .-2<CR>==",
