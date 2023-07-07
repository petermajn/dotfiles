return {
    "ThePrimeagen/harpoon",
    keys = {
        { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = "Add File" },
        { "<leader>e", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle Quickmenu" },
        { "<leader>h", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",         desc = "File 1" },
        { "<leader>j", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",         desc = "File 2" },
        { "<leader>k", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",         desc = "File 3" },
        { "<leader>l", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",         desc = "File 4" },
    },
    config = true,
}
