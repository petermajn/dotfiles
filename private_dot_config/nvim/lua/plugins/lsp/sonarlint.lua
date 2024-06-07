return {
    disabled = true,
    "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    lazy = false,
    ft = { "python", "cpp", "java", "terraform" },
    opts = {
        server = {
            cmd = {
                'sonarlint-language-server',
                -- Ensure that sonarlint-language-server uses stdio channel
                '-stdio',
                '-analyzers',
                -- paths to the analyzers you need, using those for python and java in this example
                vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
                vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
                vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
                vim.fn.expand("$MASON/share/sonarlint-analyzers/sonariac.jar"),
            }
        },
        filetypes = {
            -- Tested and working
            'python',
            'cpp',
            'java',
            'terraform',
        }
    },
}
