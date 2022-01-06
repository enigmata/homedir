local opts={noremap=true, silent=true}
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)