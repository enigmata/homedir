"""""""""""""""""""""""""""""""""""""""""
" Plugin management via Pathogen
"""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""
" Basic settings
"""""""""""""""""""""""""""""""""""""""""
"set clipboard=unnamed
set dictionary=/usr/share/dict/words
let mapleader = ";"

"""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""
syntax on           " syntax highlighting
filetype on         " detect file types
filetype plugin on
filetype indent on  " load filetype-specific indent files
"set hls            " Highlight search terms
if &diff | syntax off | endif " Turn syntax highlighting off for diff

"""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""
:set incsearch
:set ignorecase
:set smartcase
:set hlsearch
:nmap <leader>n :nohl<CR>
nnoremap <leader>a :Ag

"""""""""""""""""""""""""""""""""""""""""
" Compiling helpers
"""""""""""""""""""""""""""""""""""""""""
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>c :cclose<CR>

"""""""""""""""""""""""""""""""""""""""""
" Vim-Go
"""""""""""""""""""""""""""""""""""""""""
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

let g:go_list_type = "quickfix"
let g:go_highlight_types = 1
" let g:go_fmt_autosave = 0

"""""""""""""""""""""""""""""""""""""""""
" CPP code editing
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
" Themes: GUI vs Terminal Settings
"""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
"    set guifont=Liberation\ Mono\ 8" use this font
"    set lines=75          " height = 50 lines
"    set columns=180       " width = 100 columns
     set background=dark   " adapt colors for background
     "set background=light  " adapt colors for background
"    set background=light  " adapt colors for background
"    set keymodel=
"    set mousehide
"    colorscheme underwater-mod
"    color slate " My color scheme, adopted from TextMate
"    colorscheme slate " My color scheme, adopted from TextMate
     colorscheme solarized 
"    colorscheme void
"
"    " To set the toolbars off (icons on top of the screen)
"    set guioptions-=T
else
    let g:solarized_termtrans=1
    "set background=light   " adapt colors for dark background
    set background=dark   " adapt colors for dark background
    colorscheme molokai 
    let g:rehash256 = 1   " molokai, under dev: original 256 color version
    let g:molokai_original = 1 " molokai, original background color
    "colorscheme solarized 
    "colorscheme slate
    "colorscheme lucius
    set t_Co=256
    "set t_Co=16 " Enable 16 colors in Terminal
endif


"""""""""""""""""""""""""""""""""""""""""
" Tab stops
"""""""""""""""""""""""""""""""""""""""""
set ts=4 sts=4 sw=4 expandtab " prefer spaces instead of tab characters

" " Set tabstop, softtabstop and shiftwidth to the same value
" " Type ':Stab' in normal mode to set value
" command! -nargs=* Stab call Stab()
" function! Stab()
"   let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
"   if l:tabstop > 0
"     let &l:sts = l:tabstop
"     let &l:ts = l:tabstop
"     let &l:sw = l:tabstop
"   endif
"   call SummarizeTabs()
" endfunction
"  
" function! SummarizeTabs()
"   try
"     echohl ModeMsg
"     echon 'tabstop='.&l:ts
"     echon ' shiftwidth='.&l:sw
"     echon ' softtabstop='.&l:sts
"     if &l:et
"       echon ' expandtab'
"     else
"       echon ' noexpandtab'
"     endif
"   finally
"     echohl None
"   endtry
" endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""
" Preferences for 'autocommands' compiled VIMs
"""""""""""""""""""""""""""""""""""""""""""""""""

" Only do this part when compiled with support for autocommands
if has("autocmd")

    " Enable file type detection
    filetype on
    
    " Syntax of these languages is fussy over tabs Vs spaces
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType cpp setlocal ts=2 sts=2 sw=2 expandtab
    " autocmd FileType go   setlocal ts=4 sts=4 sw=4 expandtab
    " autocmd BufNewFile,BufRead *.go setlocal expandtab tabstop=4 shiftwidth=4 sts=4
    
    " " Customisations based on house-style (arbitrary)
    " autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    " autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
    " autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
    
    " Treat .rss files as XML
    autocmd BufNewFile,BufRead *.rss setfiletype xml
    autocmd BufWritePost .vimrc source $MYVIMRC

    " Treat .handlebars and .hbs files as HTML
    autocmd BufNewFile,BufRead *.handlebars setfiletype html
    autocmd BufNewFile,BufRead *.hbs setfiletype html
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set hidden " buffer with unsaved chgs will be hidden

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line wrapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=* Wrap set wrap linebreak nolist
" set showbreak=…   " preprend wrapped line beginnings


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cpoptions=$

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line numbering, Status line, auto indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set relativenumber
set ruler
set autoindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell Checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle spell checking on and off with `,s`
nmap <silent> <leader>s :setlocal spell! spelllang=en_ca<CR>
 
" Set region to Canada
set spelllang=en_ca


"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Schemes and Syntax Highlighting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
"
" toggle line wrapping
nmap <leader>w :setlocal wrap!<CR>:setlocal wrap?<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line bubbling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Bubble single lines
nmap <D-Up> [e
nmap <D-Down> ]e
" Bubble multiple lines
vmap <D-Up> [egv
vmap <D-Down> ]egv

"""""""""""""""""""""""""""""""""""""""""
" Navigation
"""""""""""""""""""""""""""""""""""""""""
" move single char up/down, 
" not single line up/down
nnoremap j gj
nnoremap k gk

"""""""""""""""""""""""""""""""""""""""""
" Showing metachars
"""""""""""""""""""""""""""""""""""""""""

" toggle showing invisibles
nmap <leader>L :set list!<CR>
" toggle line numbers
nmap <leader>l :setlocal number!<CR>
"  
" " Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬

" toggle paste mode
" nmap <leader>o :set paste!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
" autocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu      " visual autocomplete for cmdline

"""""""""""""""""""""""""""""""""""""""""""""""""
" file browser / navigation
"""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>f :NERDTreeToggle<CR>
