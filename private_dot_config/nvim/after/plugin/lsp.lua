local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

local lspconfig = require'lspconfig'
lspconfig.yamlls.setup{
    settings = {
        yaml = {
            schemas = { kubernetes = "*.yaml" },
        }
    }
}
