return {
    {
        "nvim-telescope/telescope.nvim",
        lazy = false,
        cmd = "Telescope",
        keys = {
            { "<leader>t",       "<cmd>Telescope<cr>",                               desc = "[T]elescope" },
            { "<leader><space>", "<cmd>Telescope find_files<cr> no_ignore=true<cr>", desc = "[F]ind [F]iles" },
            { "<leader>ff",      "<cmd>Telescope find_files no_ignore=true<cr>",     desc = "[F]ind [F]iles" },
            { "<leader>fh",      "<cmd>Telescope find_files hidden=true<cr>",        desc = "[F]ind [H]idden Files" },
            { "<leader>fr",      "<cmd>Telescope oldfiles<cr>",                      desc = "[F]ind [R]ecent" },
            { "<leader>fb",      "<cmd>Telescope buffers<cr>",                       desc = "[F]ind [B]uffers" },
            { "<leader>fg",      "<cmd>Telescope git_files<cr>",                     desc = "[F]ind [G]it Files" },
            { "<leader>f/",      "<cmd>Telescope live_grep<cr>",                     desc = "Grep" },
            {
                "<leader>fc",
                function() require("telescope.builtin").find_files({ cwd = "~/.config", hidden = true }) end,
                desc = "[F]ind [C]onfig",
            },
            -- vim.keymap.set('n', '<leader>psw', builtin.grep_string, {})
            -- vim.keymap.set('n', '<leader>ps', function()
            --     builtin.grep_string({ search = vim.fn.input("Grep > ") })
            -- end)
        },
        config = true,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        lazy = false,
        config = function()
            -- This is your opts table
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            -- To get ui-select loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require("telescope").load_extension("ui-select")
        end
    }
}
