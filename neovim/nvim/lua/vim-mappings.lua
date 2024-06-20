-- Global mappings
vim.keymap.set("n", "<leader>Q", ":qa!<CR>")
vim.keymap.set("n", "<leader><leader>", "<c-^>")
vim.keymap.set("i", ";;", "<Esc>")

-- Search
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Opening files
vim.keymap.set("c", "%%", "<C-R>=expand('%:h').'/'<cr>", { remap = false })
vim.keymap.set("n", "<leader>e", ":e <C-R>=expand('%:h').'/'<cr>")
vim.keymap.set("n", "<leader>sp", ":sp <C-R>=expand('%:h').'/'<cr>")
vim.keymap.set("n", "<leader>vsp", ":vsp <C-R>=expand('%:h').'/'<cr>")

-- Neotree mappings
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>")
