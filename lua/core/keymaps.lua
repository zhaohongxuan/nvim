vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>")

-- ---------- Visual Mode ---------- ---
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ---------- Normal Mode---------- ---
keymap.set("n", "<leader>sv", "<C-w>v", { silent = true }) -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s", { silent = true }) -- 垂直新增窗口

keymap.set("n", "<leader>nh", ":nohl<CR>", { silent = true })

keymap.set("n", "<C-L>", ":bnext<CR>", {silent = true})
keymap.set("n", "<C-H>", ":bprevious<CR>", {silent = true})

-- BufferLine
keymap.set("n", "<leader>bf", ":BufferLinePick<CR>", { silent = true })
keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>", { silent = true })

keymap.set('n', '<space>w', ":w", { silent = true })
keymap.set("n", "<leader>Q", ":qa!<CR>")

-- ---------- Edit Nvim Config------ ---
keymap.set("n", "<leader>ve", ":e ~/.config/nvim/init.lua<CR>", { silent = true })
keymap.set("n", "<leader>vk", ":e ~/.config/nvim/lua/core/keymaps.lua<CR>", { silent = true })
keymap.set("n", "<leader>vs", ":source ~/.config/nvim/init.lua<CR>", { silent = true })

-- ---------- Plugins ---------- ---
-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
keymap.set("n", "<leader>r", ":NvimTreeFocus<CR>", { silent = true })

-- hop Plugin
keymap.set('n', 's', ':HopChar2<CR>', { noremap = true, silent = true })

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
