local leet_arg = "leetcode.nvim"
local plugins = {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        opts = function()
            require("plugins.configs.lualine")
        end
    },

    {
        "nvim-tree/nvim-tree.lua",
        init = function()
            require("plugins.configs.nvim-tree")
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    }, -- 文档树

    {
        "nvim-treesitter/nvim-treesitter", -- 语法高亮
        build = ":TSUpdate",
        opts = function()
            require("plugins.configs.treesitter")
        end
    },
    "p00f/nvim-ts-rainbow", -- 配合treesitter，不同括号颜色区分
    {
        'goolord/alpha-nvim',
        init = function()
            require("plugins.configs.alpha-nvim")
        end
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
        {
            "neovim/nvim-lspconfig",
            config = function()
                require("plugins.configs.lsp")
            end
        }
    },

    {
        "phaazon/hop.nvim",
        opts = function()
            require("plugins.configs.hop")
        end
    },
    -- 自动补全
    {
        {
            "hrsh7th/nvim-cmp",
            opts = function()
                require("plugins.configs.cmp")
            end
        },
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip", -- snippets引擎，不装这个自动补全会出问题
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "hrsh7th/cmp-path", -- 文件路径

    },

    {
        "numToStr/Comment.nvim", -- gcc和gc注释
        opts = function()
            require("plugins.configs.comment")
        end
    },
    {
        "windwp/nvim-autopairs", -- 自动补全括号
        opts = function()
            require("plugins.configs.autopairs")
        end
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        opts = function()
            require("plugins.configs.bufferline")
        end

    },

    {
        "lewis6991/gitsigns.nvim", -- 左则git提示
        opts = function()
            require("plugins.configs.gitsigns")
        end
    }
    ,
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5', -- 文件检索
        opts = function()
            require("plugins.configs.telescope")
        end,
        dependencies = { 'nvim-lua/plenary.nvim' }, -- requires要改为dependencies
    },
    'nvim-telescope/telescope-project.nvim',
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

    "SmiteshP/nvim-navic",
    "onsails/lspkind.nvim",
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = true,
        opts = {
            open_mapping = [[<c-\>]],
            start_in_insert = true,
            direction = 'horizontal'
        }
    },
    {
        "kawre/leetcode.nvim",
        lazy = leet_arg ~= vim.fn.argv()[1],
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
            arg = leet_arg,
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
