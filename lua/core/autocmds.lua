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
