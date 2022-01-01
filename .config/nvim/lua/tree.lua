vim.api.nvim_set_keymap('n', '<leader>f', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ff', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

local tree_cb=require('nvim-tree.config').nvim_tree_callback

require'nvim-tree'.setup {
  view = {
    mappings = {
      custom_only = false,
      list = {
        { key = {"<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "dir_up" },
        { key = "l", cb = tree_cb "cd" },
        { key = "v", cb = tree_cb "vsplit" },
        { key = "s", cb = tree_cb "split" },
        { key = "?", cb = tree_cb "toggle_help" },
      }
    }
  }
}
