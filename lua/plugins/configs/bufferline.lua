local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup({
    options = {
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        show_close_icon = true,
        separator_style = 'slant',
        style_preset = bufferline.style_preset.default,
        event = "VeryLazy",
        hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' }
        },
        offsets = {
            {
                filetype = "NvimTree",
                text = "Nvim tree",
                text_align = "center",
                highlight = "Directory",
                seprator = true
            }
        },
    }
})
