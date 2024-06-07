local M = {}

local task_symbol = "- [ ]"
local task_string = task_symbol .. " "

M.task_new = function()
    vim.cmd.normal("^")
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { task_string })
    vim.api.nvim_win_set_cursor(0, { row, col + string.len(task_string) })
    vim.cmd('startinsert!') -- the ! makes it behave like using the "A" command in normal mode
end

M.task_new_newline = function()
    vim.cmd.normal('o ')
    M.task_new()
    vim.cmd.normal("<Del>")
end

M.task_find_brackets = function()
    vim.cmd.normal("0")
    vim.cmd.normal("t]")
end

M.task_undone = function()
    M.task_find_brackets()
    vim.cmd.normal("r ")
end

M.task_done = function()
    M.task_find_brackets()
    vim.cmd.normal("rx")
end

M.task_obsolete = function()
    M.task_find_brackets()
    vim.cmd.normal("ro")
end

M.find_tasks = function()
    require("telescope.builtin").grep_string({ search = task_symbol })
end



vim.keymap.set("n", "<leader>tn", M.task_new, { desc = "[T]ask [N]ew" })
vim.keymap.set("n", "<leader>tnn", M.task_new_newline, { desc = "[T]ask [N]ew [N]ewline" })
vim.keymap.set("n", "<leader>tu", M.task_undone, { desc = "[T]ask [U]ndone" })
vim.keymap.set("n", "<leader>td", M.task_done, { desc = "[T]ask [D]one" })
vim.keymap.set("n", "<leader>to", M.task_obsolete, { desc = "[T]ask [O]bsolete" })
vim.keymap.set("n", "<leader>ft", M.find_tasks, { desc = "[F]ind [T]asks" })

return M
