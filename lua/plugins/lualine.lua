require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    ignore_focus = {},
    always_divide_middle = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },

    globalstatus = true,
    disabled_filetypes = { statusline = { "dashboard", "alpha" } },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff','diagnostics' },
    lualine_c = {
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { "filename", path = 1, symbols = { modified = " ", readonly = "", unnamed = "" } },
      {
        function() return require("nvim-navic").get_location() end,
        cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
      },
    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
