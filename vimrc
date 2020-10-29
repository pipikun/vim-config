" vim-config

" the mapleader set.
let mapleader = "`"
let g:mapleader = "`"

set tag=tags;/

" don't compatible vi.
set nocompatible

" write file without backup.
set nobackup
set nowritebackup

" there is no need to exchange files.
set noswapfile

" shortcut keys for saving file.
nmap <leader>w :w!<CR>

" remove '^M' at the end of a windows file.
noremap <leader>m :%s/<C-V><C-M>//ge<CR>

" reopen the file to recove the previous postion of the cursor.
set viewoptions=cursor
au BufWinLeave ?* mkview
au VimEnter ?* silent loadview

" when check the document code, utf-8 is preferred.
set fileencodings=utf-8,ucs-bom,gbk,gb2312,big5,latin1

" set the end of line under different platforms.
if has("win32")
    set fileformats=dos,unix,mac
else
    set fileformats=unix,mac,dos
endif

" optimization for mulitbyte characters at line breaks
set formatoptions+=mM

" use C coding style indentation
set cindent
syntax enable
au BufEnter * :syntax sync fromstart
" detail adjustment
set cinoptions=t0,g1,h1,N-s,j1

" smart table
set smarttab
" set table defult value
set expandtab | set tabstop=4 | set shiftwidth=4
" set C/C++ table size
au FileType c,cpp,html,htmldjango,lua,javascript,nsis
            \set expandtab | set tabstop=8 | set shiftwidth=8

" Makefile retains tabs.
au FileType make set noexpandtab | set tabstop=8 | set shiftwidth=8

" limit character length to 80
au FileType c,cpp,python,vim set textwidth=80

"limited length dividing line
"set colorcolumn=81

au FileType text,markdown,html,xml set wrap

" split lines are delimited by words
set linebreak
set breakindent

" use the mouse
if has("mouse") | set mouse=a | endif

" display the commands in the input
set showcmd
set scrolloff=7
set wildmenu
set wildmode="list:longest"
set ruler

" the line of  the command line is 1 line
set cmdheight=1
set number

" don't save when switching cache
set lazyredraw
set hidden

" in input mode, backspace can delete all characters
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" display the line where the cursir is located
"set cursorline

set ignorecase
set smartcase

set incsearch
"set hlsearch

set gdefault

" remove the space at the end of a line with the replace command
func! DeleteTrailingWS()
    exec "normal mz"
    %s/\s\+$//ge
    exec "normal `z"
endfunc

" automatically delete line end spaces when saving
au BufWrite * :call DeleteTrailingWS()
map <leader>W :call DeleteTrailingWS()<CR>

" remove rows that contain only spaces
map <F3> :%s/\s*$//g<CR>:noh<CR>''<CR>

" as you see
autocmd BufNewFile *.py,*.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh exec ":call SetTitle()"
func SetTitle()
    if expand("%:e") == 'c'
        call setline(1, "#include \"".expand("%:t:r").".h\"")
        call setline(2, "")
    endif
    if expand("%:e")=='h'
        call setline(1, "#ifndef __".toupper(expand("%:t:r"))."_H__")
        call setline(2, "#define __".toupper(expand("%:t:r"))."_H__")
        call setline(3,"")
        call setline(4,"")
        call setline(5,"")
        call setline(6, "#endif /*__".toupper(expand("%:t:r"))."_H__ */")
        call setline(7, "//vim: ts=8 sw=8 noet autoindent:")
    endif
    if expand("%:e")== 'py'
        call setline(1, "#!/usr/bin/env python3")
        call setline(2, "# -*- coding: utf-8 -*-")
    endif
endfunc


" colorscheme config
set colorscheme molokai
set t_Co=256
set background=dark
syntax on
set nu!

let g:molokai_original=1
let g:rehash256=1

