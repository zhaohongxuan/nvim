 local status_ok, bufferline = pcall(require, "bufferline")
 if not status_ok then
     return
 end

bufferline.setup({
    options = {
        numbers = "ordinal",
        separator_style = "slant",
        diagnostics = "nvim_lsp",
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
