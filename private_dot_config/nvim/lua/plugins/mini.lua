return {
    {
        "echasnovski/mini.map",
        opts = {},
        keys = {
            --stylua: ignore
            { "<leader>vm", function() require("mini.map").toggle {} end, desc = "Toggle Minimap", },
        },
        config = function(_, opts)
            require("mini.map").setup(opts)
        end,
    },
    {
        'echasnovski/mini.surround',
        version = '*',
        lazy = false,
        opts = {
            mappings = {
                add = 'sa',            -- Add surrounding in Normal and Visual modes
                delete = 'sd',         -- Delete surrounding
                find = 'sf',           -- Find surrounding (to the right)
                find_left = 'sF',      -- Find surrounding (to the left)
                highlight = 'sh',      -- Highlight surrounding
                replace = 'sr',        -- Replace surrounding
                update_n_lines = 'sn', -- Update `n_lines`

                suffix_last = 'l',     -- Suffix to search with "prev" method
                suffix_next = 'n',     -- Suffix to search with "next" method
            },
        },
        config = function(_, opts)
            require("mini.surround").setup(opts)
        end,
    },
    {
        'echasnovski/mini.jump2d',
        version = '*',
        lazy = false,
        config = function(_, opts)
            require("mini.jump2d").setup(opts)
        end,
    }
}
