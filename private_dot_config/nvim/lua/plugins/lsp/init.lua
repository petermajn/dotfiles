return {
    { import = "plugins.lsp.yamlls" },
    { import = "plugins.lsp.sonarlint" },
    { import = "plugins.lsp.none-ls" },
    {
        lazy = false,
        --event = "BufReadPre",
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        -- branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
            {
                'windwp/nvim-autopairs',
                event = "InsertEnter",
                config = true
                -- use opts = {} for passing setup options
                -- this is equalent to setup({}) function
            },

            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
        },
        config = function()
            -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
            require("neodev").setup({
                -- add any options here, or leave empty to use the default settings
            })
            require("plugins.lsp.servers").setup()
            local lsp = require('lsp-zero').preset(
                {
                    name = 'recommended',
                    manage_nvim_cmp = {
                        set_extra_mappings = true,
                        set_sources = 'recommended',
                    }
                }
            )

            lsp.on_attach(function(client, bufnr)
                lsp.default_keymaps({ buffer = bufnr })
                lsp.buffer_autoformat()

                local opts = { buffer = bufnr }
                vim.keymap.set({ 'n', 'x' }, 'gq', function()
                    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
                end, opts)
                vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
            end)

            lsp.ensure_installed({
                -- Replace these with whatever servers you want to install
                'lua_ls',
                'pylsp',
                'ruff_lsp',
                'bashls',
                --'azure_pipelines_ls',
                'rust_analyzer',
                'yamlls',
                'helm_ls',
                'terraformls',
                'tflint',
                'jsonnet_ls',
                'sqlls',
                'texlab',
            })

            lsp.setup()

            local cmp = require('cmp')
            local cmp_action = require('lsp-zero').cmp_action()

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end
                },
                mapping = {
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    --['<Tab>'] = cmp_action.luasnip_supertab(),
                    --['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
                    ['<Tab>'] = cmp_action.tab_complete(),
                    ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
                },
            })
            -- If you want insert `(` after select function or method item
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done()
            )
            local lspconfig = require("lspconfig")
            lspconfig.jsonnet_ls.setup({})
            lspconfig.pylsp.setup({
                settings = {
                    pylsp = {
                        configurationSources = { "flake8" },
                        plugins = {
                            jedi_completion = {
                                include_params = true -- this line enables snippets
                            },
                        },
                    },
                },
            })
        end,
    },
    {
        "utilyre/barbecue.nvim",
        event = "VeryLazy",
        dependencies = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        config = true,
    },
}
