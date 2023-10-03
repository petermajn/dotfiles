local M = {}

M.task_new = function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { "- [ ]  " })
    vim.api.nvim_win_set_cursor(0, { row, col + 7 })
    vim.cmd('startinsert')
end

M.task_done = function()

end

M.task_obsolete = function()

end


vim.keymap.set("n", "<leader>tn", M.task_new, { desc = "[T]ask [N]ew" })


return M
