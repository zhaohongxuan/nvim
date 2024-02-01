vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")
keymap.set("n", ";", ":")

-- ---------- Visual Mode ---------- ---
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- Move to window using the <ctrl> hjkl keys
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })


keymap.set({ "i", "n" }, "<esc>", "<cmd>nohlsearch<cr><esc>", { desc = "Escape and clear elsearch", noremap = true })
--
-- BufferLine
keymap.set("n", "<A-[>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
keymap.set("n", "<A-]>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
keymap.set("n", "<leader>bf", ":BufferLinePick<CR>", { silent = true })
keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>", { silent = true })
keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

keymap.set('n', '<space>w', ":w<cr>", { silent = true })
keymap.set("n", "<leader>Q", ":qa!<CR>")
--
-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
    keymap.set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- navigation
keymap.set({ "n", "x" }, "gw", "*N", { desc = "Search word under cursor" })
keymap.set("n", "C-[", "C-o", { desc = "Navigate to last location" })
keymap.set("n", "C-]", "C-i", { desc = "Navigate to previous location" })

-- save file
keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { noremap = true }, { silent = true })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- new file
keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- ---------- Edit Nvim Config------ ---
keymap.set("n", "<leader>ve", ":e ~/.config/nvim/init.lua<CR>", { silent = true })
keymap.set("n", "<leader>vk", ":e ~/.config/nvim/lua/core/keymaps.lua<CR>", { silent = true })
keymap.set("n", "<leader>vs", ":source ~/.config/nvim/init.lua<CR>")

-- ---------- Plugins ---------- ---
---- lazy
keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
keymap.set("n", "<leader>r", ":NvimTreeFocus<CR>", { silent = true })

keymap.set('n', '<C-p>',
    ":lua require'telescope'.extensions.project.project{}<CR>",
    { noremap = true, silent = true }
)

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap.set('n', '<space>d', vim.diagnostic.open_float)
keymap.set('n', '[d', vim.diagnostic.goto_prev)
keymap.set('n', ']d', vim.diagnostic.goto_next)
keymap.set('n', '<space>q', vim.diagnostic.setloclist)
-- --------------------LSP keymap  ------------------------
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        keymap.set('n', 'R', vim.lsp.buf.rename, opts)
        keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        keymap.set({ 'n', 'v' }, '==', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

local builtin = require('telescope.builtin')
-- Telescope
keymap.set('n', '<leader><space>', builtin.find_files, {})
keymap.set('n', '<leader>sg', builtin.live_grep, {}) -- require ripgrep
keymap.set('n', '<leader>sr', builtin.oldfiles, {})  -- require ripgrep
keymap.set('n', '<leader>sb', builtin.buffers, {})
keymap.set('n', '<leader>st', builtin.help_tags, {})
keymap.set('n', '<leader>sk', builtin.keymaps, {})
keymap.set('n', '<leader>sm', builtin.marks, {})
keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, {})


-- Gitsigns
keymap.set('n', ']h', ':Gitsigns next_hunk<CR>', { silent = true })
keymap.set('n', '[h', ':Gitsigns prev_hunk<CR>', { silent = true })
keymap.set({ 'n', 'v' }, '<leader>gs', ':Gitsigns stage_hunk<CR>', { silent = true })
keymap.set({ 'n', 'v' }, '<leader>gr', ':Gitsigns reset_hunk<CR>', { silent = true })
keymap.set('n', '<leader>gb', ':Gitsigns blame_line<CR>', { silent = true })
keymap.set('n', '<leader>gd', ':Gitsigns diffthis<CR>', { silent = true })

-- LeetCode
keymap.set('n', '<leader>ll', ':Leet list<CR>', { silent = true })
keymap.set('n', '<leader>ld', ':Leet desc<CR>', { silent = true })
keymap.set('n', '<leader>lr', ':Leet run<CR>', { silent = true })
keymap.set('n', '<leader>ls', ':Leet submit<CR>', { silent = true })
keymap.set('n', '<leader>lk', ':Leet lang<CR>', { silent = true })
