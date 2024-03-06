local autocmds = vim.api.nvim_create_augroup("vimrc", { clear = true })


-- reload config on save
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "**/lua/core/*.lua",
    callback = function()
        local filepath = vim.fn.expand("%")

        dofile(filepath)
        vim.notify("Configuration reloaded \n" .. filepath, nil, {
            title = "autocmds.lua",
        })
    end,
    group = autocmds,
    desc = "Reload config on save",
})
-- Run gofmt + goimport on save

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

