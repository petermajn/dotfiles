return {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    cmd = "Telescope",
    keys = {
        { "<leader><space>", "<cmd>Telescope find_files<cr>",             desc = "Find Files" },
        { "<leader>ff",      "<cmd>Telescope find_files<cr>",             desc = "Find Files" },
        { "<leader>ffh",     "<cmd>Telescope find_files hidden=true<cr>", desc = "Find Hidden Files" },
        { "<leader>fr",      "<cmd>Telescope oldfiles<cr>",               desc = "Recent" },
        { "<leader>fb",      "<cmd>Telescope buffers<cr>",                desc = "Buffers" },
        { "<leader>fg",      "<cmd>Telescope git_files<cr>",              desc = "Git Files" },
        { "<leader>f/",      "<cmd>Telescope live_grep<cr>",              desc = "Grep" },
        {
            "<leader>ft",
            function() require("telescope.builtin").grep_string({ search = "- [ ]" }) end,
            desc = "[F]ind [T]asks",
        },
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
}
