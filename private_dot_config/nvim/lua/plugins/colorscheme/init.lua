return {
    {
        "folke/styler.nvim",
        event = "VeryLazy",
        config = function()
            require("styler").setup {
                themes = {
                    markdown = { colorscheme = "gruvbox" },
                    help = { colorscheme = "gruvbox" },
                },
            }
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            local tokyonight = require "tokyonight"
            tokyonight.setup { style = "storm" }
            tokyonight.load()
        end,
    },
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("gruvbox").setup()
        end,
    },
    {
        'rose-pine/neovim',
        lazy = false,
        name = 'rose-pine',
        config = function()
            local rose_pine = require "rose-pine"
            rose_pine.setup {
                --- @usage 'main' | 'moon'
                dark_variant = 'moon',
            }
        end,
    }
}
