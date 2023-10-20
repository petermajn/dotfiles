return {
    {
        "nvim-neotest/neotest",
        cmd = {
            "Neotest",
        },
        keys = {
            { "<leader>tr",  "<cmd>Neotest run<cr>",      desc = "[T]est [R]un" },
            { "<leader>trf", "<cmd>Neotest run file<cr>", desc = "[T]est [R]un [F]ile" },
            { "<leader>ts",  "<cmd>Neotest stop<cr>",     desc = "[T]est [S]top" },
        },
        dependencies = {
            "vim-test/vim-test",
            "nvim-neotest/neotest-vim-test",
            "nvim-neotest/neotest-python",
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "antoinemadec/FixCursorHold.nvim"
        },
        opts = function()
            return {
                adapters = {
                    require("neotest-python")({
                        dap = { justMyCode = false },
                        runner = "pytest",
                    }),
                    require("neotest-vim-test")({
                        ignore_file_types = { "python", "vim", "lua" },
                    })
                },

            }
        end
    }
}
