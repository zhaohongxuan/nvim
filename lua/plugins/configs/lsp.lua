require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    -- 确保安装，根据需要填写
    -- https://github.com/williamboman/mason-lspconfig.nvim
    ensure_installed = {
        "lua_ls", 'tsserver', "pyright", "jdtls", "gopls", "kotlin_language_server", "rust_analyzer"
    },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local navic = require("nvim-navic")
local on_attach = function(client, bufnr)
    if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
    end
end

local lsconfig = require("lspconfig")

local keymap = vim.keymap
-- --------------------LSP keymap  ------------------------
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
local telescope = require('telescope.builtin')
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        keymap.set('n', 'gd', telescope.lsp_definitions, opts)
        keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        keymap.set('n', 'gi', telescope.lsp_implementations, opts)
        keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        keymap.set('n', 'R', vim.lsp.buf.rename, opts)
        keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        keymap.set('n', 'gr',  telescope.lsp_references, opts)
        keymap.set('n', '<leader>ss', telescope.lsp_document_symbols, {})
        keymap.set('n', '<leader>sw', telescope.lsp_workspace_symbols, {})
        keymap.set({ 'n', 'v' }, '==', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

-- Setup language servers.
lsconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require'
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    capabilities = capabilities,
    on_attach = on_attach
}

lsconfig.tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

lsconfig.pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

lsconfig.jdtls.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

lsconfig.gopls.setup {
    cmd = { 'gopls' },
    -- for postfix snippets and analyzers
    capabilities = capabilities,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true,
            },
         --   staticcheck = true,
        },
    },
    on_attach = on_attach,
}

lsconfig.kotlin_language_server.setup {
    capabilities = capabilities,
    on_attach = on_attach
}

lsconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})
