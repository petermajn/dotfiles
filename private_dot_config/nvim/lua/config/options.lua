local opt = vim.opt
local g = vim.g
local indent = 4

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

opt.tabstop = indent
opt.softtabstop = indent
opt.shiftwidth = indent
opt.expandtab = true

opt.autoindent = true
opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"

opt.updatetime = 50

opt.colorcolumn = "65,80"


g.mapleader = " " 
g.maplocalleader = " " 
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })



