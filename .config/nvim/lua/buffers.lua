local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>an', ':BufferLineCycleNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>ap', ':BufferLineCyclePrev<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>amn', ':BufferLineMoveNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>amp', ':BufferLineMovePrev<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>bd', ':Bdelete<CR>', opts)

require('bufferline').setup{
  options={
    numbers='None',
    close_command="Bdelete! %d",
    right_mouse_command="Bdelete! %d",
    left_mouse_command="buffer %d",
    middle_mouse_command=nil,
    indicator_icon="▎",
    buffer_close_icon="",
    modified_icon="●",
    close_icon="",
    left_trunc_marker="",
    right_trunc_marker="",
    max_name_length=30,
    max_prefix_length=30,
    tab_size=21,
    diagnostics=false,
    diagnostics_update_in_insert=false,
    offsets={{filetype="NvimTree", text="File Explorer", padding=1}},
    show_buffer_icons=true,
    show_buffer_close_icons=true,
    show_close_icon=true,
    show_tab_indicators=true,
    persist_buffer_sort=true,
    separator_style="thin",
    enforce_regular_tabs=true,
    always_show_bufferline=true,
  },
}
