local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', 'l', api.node.open.edit, opts('open'))
    vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', 'C', api.tree.change_root_to_node, opts('Change Root'))
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
end

-- pass to setup along with your other options
require("nvim-tree").setup {
    ---
    on_attach = my_on_attach,
    ---
    sort_by = "case_sensitive",
    sync_root_with_cwd = true,
    view = {
        width = "16%",
        side = "left"
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
}
