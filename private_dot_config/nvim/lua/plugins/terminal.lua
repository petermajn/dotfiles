return {
    {
        "da-moon/telescope-toggleterm.nvim",
        event = "TermOpen",
        requires = {
            "akinsho/nvim-toggleterm.lua",
            "nvim-telescope/telescope.nvim",
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension "toggleterm"
        end,
    },
    {
        'akinsho/toggleterm.nvim',
        lazy = false,
        key = {},
        opts = {
            direction = 'float',
            open_mapping = [[<c-\>]],
        },
    }
}
