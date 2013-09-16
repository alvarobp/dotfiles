set nocompatible

set expandtab
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2

set showmatch
set incsearch
set hlsearch

" set number

set hidden

syntax on
set t_Co=256
set background=dark
colorscheme vividchalk

filetype plugin indent on

imap ;; <Esc>

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Sessions
set sessionoptions=buffers
