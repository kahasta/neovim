return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            {
                "nvim-telescope/telescope-live-grep-args.nvim",
                -- This will not install any breaking changes.
                -- For major updates, this must be adjusted manually.
                version = "^1.0.0",
            },
        },
        config = function()
            require("telescope").load_extension("live_grep_args")
            require("telescope").setup {
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    }
                }
            }
            require("telescope").load_extension("fzf")
        end
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    { "smartpde/telescope-recent-files" },

    -- Themes
    {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            -- vim.cmd('colorscheme rose-pine')
        end
    },
    {
        "rafamadriz/neon",
        config = function()
            vim.g.neon_style = "doom"
            -- vim.cmd [[colorscheme neon]]
        end
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd [[colorscheme tokyonight-moon]]
        end
    },
    'tomasiser/vim-code-dark',
    'marko-cerovac/material.nvim',
    { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000 },
    { "bluz71/vim-moonfly-colors",  name = "moonfly",  lazy = false, priority = 1000 },
    'sainnhe/sonokai',
    'nyoom-engineering/oxocarbon.nvim',
    'glepnir/zephyr-nvim',
    'rockerBOO/boo-colorscheme-nvim',
    'jim-at-jibba/ariake-vim-colors',
    'mhartington/oceanic-next',
    'tjdevries/colorbuddy.vim',
    'Th3Whit3Wolf/onebuddy',
    'sainnhe/edge',
    -- Theme selector
    'lrangell/theme-cycler.nvim',

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'nvim-treesitter/playground',

    'theprimeagen/harpoon',
    ('mbbill/undotree'),
    ('tpope/vim-fugitive'),
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- im add this for show info where typing code
            { "folke/neodev.nvim",                opts = {} },
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    },


    {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to  the default settings
                -- refer to the configuration section below
            }
        end
    },

    {
        'akinsho/flutter-tools.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    'nvim-tree/nvim-web-devicons',
    --
    -- ({
    --     "NTBBloodbath/galaxyline.nvim",
    --     -- your statusline
    --     config = function()
    --         require("galaxyline.themes.eviline")
    --     end,
    --     -- some optional icons
    --     dependencies = { "kyazdani42/nvim-web-devicons", opt = true }
    -- })

    {
        'nvim-lualine/lualine.nvim',
        confiq = function()
            require('lualine').setup {
                -- options = {
                --     theme = 'tokyonight'
                -- }
            }
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },

    "lukas-reineke/indent-blankline.nvim",

    {
        "romgrk/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup {
                enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
                throttle = true, -- Throttles plugin updates (may improve performance)
                max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
                patterns = {     -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    -- For all filetypes
                    -- Note that setting an entry here replaces all other patterns for this entry.
                    -- By setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        'class',
                        'function',
                        'method',
                    },
                },
            }
        end
    },
    {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup()
        end
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function() require "lsp_signature".on_attach() end,
    },
    {
        "karb94/neoscroll.nvim",
        event = "WinScrolled",
        config = function()
            require('neoscroll').setup({
                -- All these keys will be mapped to their corresponding default scrolling animation
                mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
                    '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
                hide_cursor = true,          -- Hide cursor while scrolling
                stop_eof = true,             -- Stop at <EOF> when scrolling downwards
                use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
                respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing_function = nil,       -- Default easing function
                pre_hook = nil,              -- Function to build before the scrolling animation starts
                post_hook = nil,             -- Function to build after the scrolling animation ends
            })
        end
    },
    {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
            require("todo-comments").setup()
        end,
    },

    {
        "tpope/vim-surround",

        -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
        -- setup = function()
        --  vim.o.timeoutlen = 500
        -- end
    },

    -- {
    --     'phaazon/hop.nvim',
    --     branch = 'v2', -- optional but strongly recommended
    --     config = function()
    --         -- you can configure Hop the way you like here; see :h hop-config
    --         require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    --     end
    -- },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        --@type Flash.Config
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
    -- Barbar
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'romgrk/barbar.nvim',
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    },

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    -- Для скачков по F f t T
    -- {
    --     "rhysd/clever-f.vim",
    --     config = function()
    --         -- config
    --     end
    -- },
    -- amongst your other plugins
    { 'akinsho/toggleterm.nvim',         version = "*",      config = true },
    -- or
    { 'akinsho/bufferline.nvim',         version = "*",      dependencies = 'nvim-tree/nvim-web-devicons' },
    -- Highlight words
    { "RRethy/vim-illuminate" },
    { 'charludo/projectmgr.nvim' },
    {
        "anuvyklack/windows.nvim",
        dependencies = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim"
        },
        config = function()
            vim.o.winwidth = 10
            vim.o.winminwidth = 10
            vim.o.equalalways = false
            require('windows').setup()
        end
    },
    -- Animations cursor and etc
    --  { 'echasnovski/mini.nvim', branch = 'stable',
    --     config = function()
    --         require('mini.animate').setup()
    --     end
    -- }
    {
        'HiPhish/rainbow-delimiters.nvim',
        config = function()
        end
    },
    -- join in line code or unpack
    {
        'Wansmer/treesj',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesj').setup({ --[[ your config ]] })
        end,
    },

    -- Window Resizing
    {
        'simeji/winresizer',
    },
    -- Debugger
    { 'mfussenegger/nvim-dap' },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    -- {
    --     "nvim-tree/nvim-tree.lua",
    --     version = "*",
    --     lazy = false,
    --     dependencies = {
    --         "nvim-tree/nvim-web-devicons",
    --     },
    --     config = function()
    --         local function my_on_attach(bufnr)
    --             local api = require "nvim-tree.api"
    --
    --             local function opts(desc)
    --                 return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    --             end
    --
    --             -- default mappings
    --             api.config.mappings.default_on_attach(bufnr)
    --
    --             -- custom mappings
    --             vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
    --         end
    --         require("nvim-tree").setup {
    --             on_attach = my_on_attach,
    --         }
    --     end,
    -- },
    {
        -- Для сворачивания кода функций и тд
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        config = function()
            vim.o.foldcolumn = '1' -- '0' is not bad
            vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true
            -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
            vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
            require('ufo').setup();
        end
    },
    'xiyaowong/transparent.nvim',
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     opts = {
    --         -- add any options here
    --     },
    --     dependencies = {
    --         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --         "MunifTanjim/nui.nvim",
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, we use `mini` as the fallback
    --         "rcarriga/nvim-notify",
    --     }
    -- },
    {
        'stevearc/aerial.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },

    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        ft = "markdown",
        -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
        -- event = {
        --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
        --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
        --   "BufReadPre path/to/my-vault/**.md",
        --   "BufNewFile path/to/my-vault/**.md",
        -- },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "~/obsidian/Mysave",
                },
            },

            -- see below for full list of options 👇
        },
    },
    {
        'rcarriga/nvim-notify',
        config = function()
            vim.notify = require('notify');
        end
    },

    { 'airblade/vim-rooter' },

}
