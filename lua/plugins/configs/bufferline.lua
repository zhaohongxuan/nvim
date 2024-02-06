local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup({
    options = {
        numbers = "ordinal",
        separator_style = "slant",
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        show_close_icon = false,
        event = "VeryLazy",
        offsets = {
            {
                filetype = "NvimTree",
                text = "Nvim tree",
                text_align = "center",
                highlight = "Directory",
            }
        },
    }
})
