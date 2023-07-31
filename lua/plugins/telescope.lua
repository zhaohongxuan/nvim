
require("telescope").load_extension("project")
require("telescope").load_extension("file_browser")

require('telescope').setup {
  defaults = {
    layout_config = {
      vertical = { width = 0.5 }
    },
  },
  -- other defaults configuration here
  extensions = {
    project = {
      base_dirs = {
        '~/VSCodeProjects',
        {'~/Developer/'},
        {'~/IdeaProjects', max_depth = 4},
      },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "asc",
      search_by = "title",
      sync_with_nvim_tree = true, -- default false
    }
  }
}
