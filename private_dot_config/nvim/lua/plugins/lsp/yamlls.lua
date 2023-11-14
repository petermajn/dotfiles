return {
    {
        "someone-stole-my-name/yaml-companion.nvim",
        lazy = false,
        dependencies = {
            { "neovim/nvim-lspconfig" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" },
        },
        config = function()
            require("telescope").load_extension("yaml_schema")
            local cfg = require("yaml-companion").setup({
                -- Add any options here, or leave empty to use the default settings
                -- lspconfig = {
                --   cmd = {"yaml-language-server"}
                -- },
            })
            require("lspconfig")["yamlls"].setup(cfg)
        end,
    }
}
