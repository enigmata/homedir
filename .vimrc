"""""""""""""""""""""""""""""""""""""""""
" Basic settings
"""""""""""""""""""""""""""""""""""""""""
set number
set ruler
set autoindent
set relativenumber
set nowrap        " plays nicer with relativenumber
set paste         " handle pasting text from other windows
set wildmenu      " visual autocomplete for cmdline
set laststatus=2  " always display status line
set cpoptions=$   " put a '$' at end of changed text
set ts=4 sts=4 sw=4 expandtab " prefer spaces to tab characters
set listchars=tab:▸\ ,eol:¬

let mapleader = ";"

command! -nargs=* Wrap set wrap linebreak nolist
nmap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

nmap <leader>o :set paste!<CR>:setlocal paste?<CR>

" toggle showing white space chars
nmap <leader>L :set list!<CR>

"""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""
syntax on           " syntax highlighting
filetype on         " detect file types
filetype plugin on
filetype indent on  " load filetype-specific indent files
if &diff | syntax off | endif " Turn syntax highlighting off for diff

"""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap <leader>n :nohl<CR>

"""""""""""""""""""""""""""""""""""""""""
" Compiling helpers
"""""""""""""""""""""""""""""""""""""""""
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>c :cclose<CR>

"""""""""""""""""""""""""""""""""""""""""
" Vim-Go
"""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd FileType go nmap <leader>b  <Plug>(go-build)
    autocmd FileType go nmap <leader>r  <Plug>(go-run)
endif

let g:go_list_type = "quickfix"
let g:go_highlight_types = 1

"""""""""""""""""""""""""""""""""""""""""
" C/C++ code editing
"""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd FileType cpp setlocal ts=2 sts=2 sw=2 expandtab

    function! FormatCppOnSave()
        let l:formatdiff = 1
        pyf ~/mbin/clang-format.py
    endfunction
    autocmd BufWritePre *.h,*.hpp,*.cpp call FormatCppOnSave()
endif

"""""""""""""""""""""""""""""""""""""""""
" Makefiles
"""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
endif

"""""""""""""""""""""""""""""""""""""""""
" YAML
"""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell Checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle spell checking on and off with `;s`
nmap <silent> <leader>s :setlocal spell! spelllang=en_ca<CR>
 
" Set region to Canada
set spelllang=en_ca
set dictionary=/usr/share/dict/words

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Schemes and Syntax Highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme solarized 

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

if exists('*HexHighlight()')
  nmap <leader>h :call HexHighlight()<Return>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line bubbling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bubble single lines
nmap <D-Up> [e
nmap <D-Down> ]e
" Bubble multiple lines
vmap <D-Up> [egv
vmap <D-Down> ]egv

"""""""""""""""""""""""""""""""""""""""""""""""""
" file browser / navigation
"""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>f :NERDTreeToggle<CR>
