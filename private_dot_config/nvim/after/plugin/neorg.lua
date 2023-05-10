local journal = require("neorg.modules.core.journal.module")


vim.keymap.set("n", "<leader>jj", journal.private.diary_today)
vim.keymap.set("n", "<leader>jt", journal.private.diary_tomorrow)
vim.keymap.set("n", "<leader>jy", journal.private.diary_yesterday)
