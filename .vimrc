call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible

" General appearance and behaviour
filetype plugin indent on
syntax on
set visualbell t_vb=
set noerrorbells
set ruler
set showcmd
set showmatch
set wildmenu
set wildmode=list:longest,full
set backspace=indent,eol,start
set nowrap
set linebreak
set lazyredraw
set number

set nomodeline

" MOUSE with VIM ! (YES)
set mouse=a
set ttymouse=xterm2
set scrolloff=1

" Indentation options
set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set virtualedit=block
set equalprg=

" Search options
set incsearch
set hlsearch

"set lines=50 columns=100
if has("gui_running")
  "Maximize gvim window.
  set lines=999 columns=999
endif

let g:NERDTreeWinSize=50

set gfn=Inconsolata\ 11
set guifont=Inconsolata\ 11


source /usr/share/vim/vim72/mswin.vim
behave mswin

nmap <D-[> <<
nmap <D-]> >>
vmap <D-[> <gv
vmap <D-]> >gv


set backupdir=/var/vim/backup
set directory=/var/vim/

colorscheme 256_xoria

if has("autocmd")
  " DRUPAL SETTINGS
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END

  " autocompletion
  autocmd Filetype java setlocal omnifunc=javacomplete#Complete

  " auto-open taglist on programming files
  autocmd BufRead,BufNewFile * if &ft == 'python' | execute "TlistOpen" | endif
  autocmd BufRead,BufNewFile * if &ft == 'java' | execute "TlistOpen" | endif
  autocmd BufRead,BufNewFile * if &ft == 'ruby' | execute "TlistOpen" | endif
  autocmd BufRead,BufNewFile * if &ft == 'php' | execute "TlistOpen" | endif
endif

" taglist settings
let Tlist_Ctags_Cmd="/opt/ctags-5.8/ctags"

" no sure if I need this yet for java autocompletion ...
"setlocal completefunc=javacomplete#CompleteParamsInfo
"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
"inoremap <buffer> <C-S-Space> <C-X><C-U><C-P>

if has("gui")
  " set Ctrl-Space for autocompletion
  inoremap <C-Space> <C-x><C-o>
endif


function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>


syntax on
