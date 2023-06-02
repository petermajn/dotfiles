local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

return {
  "ThePrimeagen/harpoon",
  keys = {
    {"<leader>a", mark.add_file, desc="Add File"},
    {"<leader>e", ui.toggle_quick_menu, desc="Toggle Quickmenu"},
    {"<leader>h", function() ui.nav_file(1) end, desc="File 1"},
    {"<leader>j", function() ui.nav_file(2) end, desc="File 2"},
    {"<leader>k", function() ui.nav_file(3) end, desc="File 3"},
    {"<leader>l", function() ui.nav_file(4) end, desc="File 4"},
  },
  config = true,
}
