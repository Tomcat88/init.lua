local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = ","

opt.history = 1000
opt.mouse = "a"
opt.autoread = true
opt.cmdheight = 2
opt.shortmess = opt.shortmess + "c"
opt.tm = 2000

opt.ruler = true
opt.nu = true
opt.rnu = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. '/.vim/undodir'
opt.undofile = true

opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

opt.showmatch = true
opt.mat = 2

opt.errorbells = false
opt.visualbell = false

opt.showmode = false
