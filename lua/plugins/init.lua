local leet_arg = "leetcode.nvim"
local plugins = {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugins.configs.lualine")
        end
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
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
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
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
        config = function()
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
    { 'wakatime/vim-wakatime', lazy = false },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

}
local opts = {} -- 注意要定义这个变量

require("lazy").setup(plugins, opts)
