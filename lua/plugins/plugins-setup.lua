local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    "folke/tokyonight.nvim",               -- 主题
    "nvim-lualine/lualine.nvim",           -- 状态栏
    "nvim-tree/nvim-tree.lua",             -- 文档树
    "nvim-tree/nvim-web-devicons",         -- 文档树图标
    {
        "nvim-treesitter/nvim-treesitter", -- 语法高亮
        build = ":TSUpdate"
    },
    "p00f/nvim-ts-rainbow", -- 配合treesitter，不同括号颜色区分
    {
        'goolord/alpha-nvim',
        lazy = true
    },

    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
        "neovim/nvim-lspconfig"
    },

    "phaazon/hop.nvim",
    -- 自动补全
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip", -- snippets引擎，不装这个自动补全会出问题
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-path",        -- 文件路径

    "numToStr/Comment.nvim",   -- gcc和gc注释
    "windwp/nvim-autopairs",   -- 自动补全括号

    "akinsho/bufferline.nvim", -- buffer分割线
    "lewis6991/gitsigns.nvim", -- 左则git提示

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',                              -- 文件检索
        dependencies = { 'nvim-lua/plenary.nvim' }, -- requires要改为dependencies
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

    "SmiteshP/nvim-navic",
    "onsails/lspkind.nvim",
    'nvim-telescope/telescope-project.nvim',
    { 'akinsho/toggleterm.nvim', version = "*", config = true },
    {
        "kawre/leetcode.nvim",
        build = ":TSUpdate html",
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim", -- required by telescope
            "MunifTanjim/nui.nvim",

            -- optional
            "nvim-treesitter/nvim-treesitter",
            "rcarriga/nvim-notify",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            cn = { -- leetcode.cn
                enabled = true, ---@type boolean
                translator = true, ---@type boolean
                translate_problems = true, ---@type boolean
            },
            lang = "java",
        },
    },
    {
        "chrisgrieser/nvim-various-textobjs",
        lazy = false,
        opts = { useDefaultKeymaps = true },
    }
}
local opts = {} -- 注意要定义这个变量

require("lazy").setup(plugins, opts)
