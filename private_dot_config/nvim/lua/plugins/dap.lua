local M = {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            { "rcarriga/nvim-dap-ui" },
            { "theHamsta/nvim-dap-virtual-text" },
            { "nvim-telescope/telescope-dap.nvim" },
            { "jay-babu/mason-nvim-dap.nvim" },
            { "LiadOz/nvim-dap-repl-highlights",  opts = {} },
        },
        keys = {
            {
                "<leader>dR",
                function() require("dap").run_to_cursor() end,
                desc = "Run to Cursor",
            },
            {
                "<leader>dE",
                function() require("dapui").eval(vim.fn.input "[Expression] > ") end,
                desc = "Evaluate Input",
            },
            {
                "<leader>dC",
                function() require("dap").set_breakpoint(vim.fn.input "[Condition] > ") end,
                desc = "Conditional Breakpoint",
            },
            {
                "<leader>dU",
                function() require("dapui").toggle() end,
                desc = "Toggle UI",
            },
            {
                "<leader>db",
                function() require("dap").step_back() end,
                desc = "Step Back",
            },
            {
                "<leader>dc",
                function() require("dap").continue() end,
                desc = "Continue",
            },
            {
                "<leader>dd",
                function() require("dap").disconnect() end,
                desc = "Disconnect",
            },
            {
                "<leader>de",
                function() require("dapui").eval() end,
                mode = { "n", "v" },
                desc = "Evaluate",
            },
            {
                "<leader>dg",
                function() require("dap").session() end,
                desc = "Get Session",
            },
            {
                "<leader>dh",
                function() require("dap.ui.widgets").hover() end,
                desc = "Hover Variables",
            },
            { "<leader>dS", function() require("dap.ui.widgets").scopes() end, desc = "Scopes", },
            {
                "<leader>di",
                function() require("dap").step_into() end,
                desc = "Step Into",
            },
            {
                "<leader>do",
                function() require("dap").step_over() end,
                desc = "Step Over",
            },
            {
                "<leader>dl",
                function() require("dap").run_last() end,
                desc = "Run Last"
            },
            { "<leader>dp", function() require("dap").pause.toggle() end,      desc = "Pause", },
            { "<leader>dq", function() require("dap").close() end,             desc = "[Q]uit", },
            {
                "<leader>dr",
                function() require("dap").repl.toggle() end,
                desc = "Toggle REPL",
            },
            { "<leader>ds", function() require("dap").continue() end, desc = "Start", },
            {
                "<leader>dt",
                function() require("dap").toggle_breakpoint() end,
                desc = "Toggle Breakpoint",
            },
            {
                "<leader>dx",
                function() require("dap").terminate() end,
                desc = "Terminate",
            },
            {
                "<leader>du",
                function() require("dap").step_out() end,
                desc = "Step Out",
            },
        },
        opts = {
            setup = {},
        },
        config = function(plugin, opts)
            --local icons = require "config.icons"
            --vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

            --for name, sign in pairs(icons.dap) do
            --    sign = type(sign) == "table" and sign or { sign }
            --    vim.fn.sign_define("Dap" .. name,
            --        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] })
            --end

            require("nvim-dap-virtual-text").setup {
                commented = true,
            }

            local dap, dapui = require "dap", require "dapui"
            dapui.setup {}

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end

            -- set up debugger
            for k, _ in pairs(opts.setup) do
                opts.setup[k](plugin, opts)
            end

            local get_python_version = function()
                local python = vim.api.nvim_exec("!pyenv which python", true)
                print(vim.inspect(python))
                local lines = vim.split(python, '\n')
                return lines[3]
            end
            dap.configurations.python = {
                {
                    name = "pyenv-version",
                    program = "${file}",
                    pythonPath = get_python_version,
                    request = "launch",
                    type = "python",
                    justMyCode = false,
                },
                -- {
                --     name = "atlassian",
                --     program = "${file}",
                --     pythonPath = "/Users/jan/.pyenv/versions/3.10.9/envs/admin_atlassian/bin/python",
                --     request = "launch",
                --     type = "python",
                --     justMyCode = false,
                -- },
                -- {
                --     name = "confluence_backup",
                --     program = "${file}",
                --     pythonPath = "/Users/jan/.pyenv/versions/3.10.9/envs/confluence_backup/bin/python",
                --     request = "launch",
                --     type = "python",
                --     justMyCode = false,
                -- }
                -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
            }
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
            automatic_setup = true,
            handlers = {},
            ensure_installed = {
                "python"
            },
        },
    },
}

return M
