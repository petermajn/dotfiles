return {
    "rest-nvim/rest.nvim",
    ft = "http",
    -- lazy = false,
    dependencies = { { "nvim-lua/plenary.nvim" } },
    keys = {
        { "<leader>r",  function() require('rest-nvim').run() end,                   desc = "[R]est" },
        { "<leader>rp", function() require('rest-nvim').run({ verbose = true }) end, desc = "[R]est [P]review" },
        { "<leader>rl", function() require('rest-nvim').last() end,                  desc = "[R]est [L]ast" },
    },
    config = function()
        require('rest-nvim').setup({
            --- Get the same options from Packer setup
        })
    end
}
