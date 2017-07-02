if exists('did_load_filetypes') | fini | en
au BufRead,BufNewFile *.lua setf lua
au BufRead,BufNewFile *.json setf javascript
