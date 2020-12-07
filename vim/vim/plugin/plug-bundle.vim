call plug#begin('~/.vim-bundle')

Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'wincent/ferret', { 'on': ['Ack', 'Acks'] }
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' } " Full path fuzzy file, buffer, mru, tag, finder for Vim
Plug 'godlygeek/tabular' " text filtering and alignment
Plug 'tpope/vim-endwise' " wisely add 'end' in ruby, endfunction/endif/more
Plug 'tpope/vim-commentary', { 'tag': 'v1.3' } " comment stuff out
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'moll/vim-bbye' " Delete buffers and close files in Vim without closing your windows
Plug 'mengelbrecht/lightline-bufferline' " Bufferline plugin

Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'
Plug 'pangloss/vim-javascript'

" Add plugins to &runtimepath
call plug#end()
