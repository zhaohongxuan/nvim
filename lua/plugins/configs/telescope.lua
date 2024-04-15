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
                '/Users/hank.zhao/VSCodeProjects',
                '/Users/hank.zhao/IdeaProjects',
                '/Users/hank.zhao/GoProjects/src/growth-marketing/',
            },
            hidden_files = true, -- default: false
            theme = "dropdown",
            order_by = "asc",
            sync_with_nvim_tree = true, -- default false
            search_by = "title",
            on_project_selected = function(prompt_bufnr)
                -- Do anything you want in here. For example:
                project_actions.change_working_directory(prompt_bufnr, false)
            end,
        }
    }
}
