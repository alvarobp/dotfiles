vim.cmd("set expandtab") -- Global tab width.
vim.cmd("set tabstop=2") -- And again, related.
vim.cmd("set softtabstop=2") -- Use spaces instead of tabs
vim.cmd("set shiftwidth=2") -- Makes the spaces feel like real tabs

vim.cmd("set autoindent")
vim.cmd("set backspace=indent,eol,start") -- Intuitive backspacing.

vim.cmd("set showmatch")
vim.cmd("set incsearch") -- Highlight matches as you type.
vim.cmd("set hlsearch") -- Highlight matches.

vim.opt.number = true
vim.g.background = "light"

vim.opt.swapfile = false

vim.g.mapleader = ","

-- Show special chars as characters
vim.opt.listchars = { tab = "▶ ", trail = "~", extends = ">", precedes = "<", nbsp = ".", eol = "↵" }
vim.opt.list = true
