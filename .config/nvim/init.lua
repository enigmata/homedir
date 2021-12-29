
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.hidden = true
vim.opt.autoindent = true
vim.opt.signcolumn = 'auto'
vim.opt.wrap = false
vim.opt.wildmenu = true
vim.opt.confirm = true
vim.opt.scrolloff = 8
vim.opt.laststatus = 2
vim.opt.cpoptions = '$'
vim.opt.ts = 4 
vim.opt.sts = 4
vim.opt.sw = 4
vim.opt.expandtab = true
vim.opt.listchars = {tab = '▸ ', eol = '¬', trail = '·'}
vim.opt.background = 'dark'
vim.opt.syntax = 'enable'
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

vim.cmd('colorscheme solarized')

vim.g.mapleader = " "

vim.api.nvim_set_keymap('n', '<leader>eol', ':set list!<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>deol', ':%s/\\\\s\\\\+$//gc<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', ':nohl<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-n>', ':cnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<C-m>', ':cprevious<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':cclose<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('t', '<leader>h', '<C-\\><C-N><C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<leader>j', '<C-\\><C-N><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<leader>k', '<C-\\><C-N><C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<leader>l', '<C-\\><C-N><C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<leader>ul', '<C-\\><C-N><C-w>t', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<leader>lr', '<C-\\><C-N><C-w>b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<leader>p', '<C-\\><C-N><C-w>p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ul', '<C-w>t', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lr', '<C-w>b', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', '<C-w>p', { noremap = true, silent = true })
