local keymap = vim.keymap.set

-- keymap("n", "<leader>pv", vim.cmd.Ex)

keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Visual: Move Line Down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Visual: Move Line Up" })

keymap("n", "J", "mzJ`z", { desc = "Concat Line from below" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Move Page [D]own" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Move Page [U]p" })
keymap("n", "n", "nzzzv", { desc = "Search: Next Result" })
keymap("n", "N", "Nzzzv", { desc = "Search: Previous Result" })

keymap("x", "<leader>p", "\"_dP", { desc = "Visual: Replace with Yanked" })

keymap("n", "<leader>y", "\"+y")
keymap("v", "<leader>y", "\"+y")
keymap("n", "<leader>Y", "\"+Y")

keymap("n", "<leader>d", "\"_d", { desc = "[D]elete to Void" })
keymap("v", "<leader>d", "\"_d", { desc = "[D]elete to Void" })

keymap("n", "Q", "<noop>")

keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "[S]ubsitite Word on Cursor" })
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Current File: chmod +x" })
keymap("n", "<leader>-x", "<cmd>!chmod -x %<CR>", { silent = true, desc = "Current File: chmod -x" })

-- Move Lines
keymap("n", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap("n", "<A-k>", ":m .-2<CR>==")
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv")
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
