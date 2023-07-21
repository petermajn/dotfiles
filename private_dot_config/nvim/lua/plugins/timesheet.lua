local M = {
    enabled = false,
    dir = '~/projects/vim-timesheet-plugin',
    lazy = false,
}

M['config'] = function()
    vim.cmd('source ' .. M.dir .. '/ftplugin/times.vim')
    vim.cmd('source ' .. M.dir .. '/syntax/times.vim')
end

return { M }
