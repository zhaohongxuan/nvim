require("telescope").load_extension("project")
require("telescope").load_extension("file_browser")

require('telescope').setup {
    defaults = {
        layout_config = {
            vertical = { width = 0.5 }
        },
        file_ignore_patterns = { "node_modules" }
    },
    -- other defaults configuration here
    extensions = {
        project = {
            base_dirs = {
                '~/VSCodeProjects',
                '~/IdeaProjects',
            },
            hidden_files = true, -- default: false
            theme = "dropdown",
            order_by = "asc",
            search_by = "title"
        }
    }
}
