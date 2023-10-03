return {
    {
        "nvim-neotest/neotest",
        lazy = false,
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
