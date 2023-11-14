return {
    {
        "nvim-telescope/telescope-file-browser.nvim",
        lazy = false,
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>tfb", "<cmd>Telescope file_browser<cr>", desc = "[T]elescope [F]ile [B]rowser" },
        },
        config = function()
            require("telescope").setup {
                extensions = {
                    file_browser = {
                        -- disables netrw and use telescope-file-browser in its place
                        hijack_netrw = false,
                    },
                },
            }
            require("telescope").load_extension "file_browser"
        end
    },
    {
        'stevearc/oil.nvim',
        lazy = false,
        opts = {
            -- config = function()
            --     require("oil").setup({
            --     })
            -- end,
            default_file_explorer = true,
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            },
        },
        keys = {
            { "-",          "<cmd>Oil<cr>", desc = "Open parent directory" },
            { "<leader>pv", "<cmd>Oil<cr>", desc = "[P]roject [V]iew" },
        },
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },

    }

}
