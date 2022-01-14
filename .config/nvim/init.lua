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
vim.opt.termguicolors=true

vim.cmd('filetype plugin on')

require('plugins')
require('treesitter')
require('tree')
require('lsp')
require('completion')
require('telescope')
require('buffers')
require('nightfox').load("nordfox")
require('lualine').setup()
require('keymaps')
require('finder')
