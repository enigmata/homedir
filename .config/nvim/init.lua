vim.opt.relativenumber=true
vim.opt.number=true
vim.opt.ruler=true
vim.opt.hidden=true
vim.opt.autoindent=true
vim.opt.signcolumn='auto'
vim.opt.wrap=false
vim.opt.wildmenu=true
vim.opt.confirm=true
vim.opt.scrolloff=8
vim.opt.laststatus=2
vim.opt.cpoptions='$'
vim.opt.ts=4
vim.opt.sts=4
vim.opt.sw=4
vim.opt.expandtab=true
vim.opt.listchars={tab = '▸ ', eol = '¬', trail = '·'}
vim.opt.background='dark'
vim.opt.syntax='enable'
vim.opt.incsearch=true
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.hlsearch=true
vim.opt.mouse="a"

vim.cmd('colorscheme solarized')

vim.g.mapleader = " "

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>qq', ':qa<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>eol', ':set list!<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>deol', ':%s/\\\\s\\\\+$//gc<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>n', ':nohl<CR>', opts)
vim.api.nvim_set_keymap('', '<C-n>', ':cnext<CR>', opts)
vim.api.nvim_set_keymap('', '<C-m>', ':cprevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>c', ':cclose<CR>', opts)

vim.api.nvim_set_keymap('t', '<leader>h', '<C-\\><C-N><C-w>h', opts)
vim.api.nvim_set_keymap('t', '<leader>j', '<C-\\><C-N><C-w>j', opts)
vim.api.nvim_set_keymap('t', '<leader>k', '<C-\\><C-N><C-w>k', opts)
vim.api.nvim_set_keymap('t', '<leader>l', '<C-\\><C-N><C-w>l', opts)
vim.api.nvim_set_keymap('t', '<leader>ul', '<C-\\><C-N><C-w>t', opts)
vim.api.nvim_set_keymap('t', '<leader>lr', '<C-\\><C-N><C-w>b', opts)
vim.api.nvim_set_keymap('t', '<leader>p', '<C-\\><C-N><C-w>p', opts)
vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', opts)
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', opts)
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', opts)
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', opts)
vim.api.nvim_set_keymap('n', '<leader>ul', '<C-w>t', opts)
vim.api.nvim_set_keymap('n', '<leader>lr', '<C-w>b', opts)
vim.api.nvim_set_keymap('n', '<leader>p', '<C-w>p', opts)

vim.cmd('hi! vimStatuslineBufInfo ctermbg=2 ctermfg=0')
vim.cmd('hi! vimStatuslineBufInfoSep ctermbg=4 ctermfg=2')
vim.cmd('hi! vimStatuslineFileInfo ctermbg=4 ctermfg=0')
vim.cmd('hi! vimStatuslineFileInfoSep ctermbg=0 ctermfg=4')
vim.cmd('hi! vimStatuslineCenter ctermbg=0 ctermfg=11')
vim.opt.statusline = '%#vimStatuslineBufInfo#Buffer=%n %#vimStatuslineBufInfoSep#%#vimStatuslineFileInfo# %t%r%m%h %#vimStatuslineFileInfoSep#%#vimStatuslineCenter# %f%=%#vimStatuslineFileinfoSep#%#vimStatuslineFileInfo# %y%q %#vimStatuslineBufInfoSep#%#vimStatuslineBufInfo# col=%c,line=%l/%L(%p%%) '

vim.cmd('filetype plugin on')

require('plugins')
require('treesitter')
require('tree')
require('lsp')
require('completion')
require('telescope')
require('buffers')
