set encoding=utf-8
set nocompatible                  " Must come first because it changes other options.

syntax enable                     " Turn on syntax highlighting.

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs
set softtabstop=2                 " Makes the spaces feel like real tabs

set autoindent
set backspace=indent,eol,start    " Intuitive backspacing.

set pastetoggle=<F2>              " Toggle paste mode

set showmatch
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.scssc,*.sassc

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp      " Keep swap files in one location
set backupdir=$HOME/.vim/_backup  " where to put backup files.

set autoread                      " Update open files when changed externally

set laststatus=2                  " Show the status line all the time
set listchars=tab:▸\ ,eol:¬

set t_Co=256
set background=dark
colorscheme vividchalk

let g:bufferline_echo = 0         " Don't print bufferline bar

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"" Load plugins
runtime macros/matchit.vim        " Load the matchit plugin.
runtime! plugins/rspec.vim

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim-bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'mileszs/ack.vim'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-surround'
NeoBundle 'godlygeek/tabular'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'bling/vim-bufferline'
NeoBundle 'moll/vim-bbye'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'

filetype plugin indent on         " Turn on file type detection.

" Syntax of these languages is fussy over tabs Vs spaces
autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Customisations based on house-style (arbitrary)
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

"" Mappings
imap ;; <Esc>

" Disable arroy keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

let mapleader=","
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :e %%
map <leader>sp :sp %%
map <leader>vsp :vsp %%

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Repeat last command
" :noremap <C-P> @:<CR>

" Configure bufferline
let g:bufferline_echo = 0
autocmd VimEnter *
  \ let &statusline='%{bufferline#refresh_status()}' . bufferline#get_status_string() . ' %=%l,%v' . '        %P'

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

" Create non-existent dirs on file save
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir)
          \   && (a:force
          \       || input("'" . a:dir . "' does not exist. Create? [y/N]") =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

" Configure CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPCurWD'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer = 0 " open in new buffer
