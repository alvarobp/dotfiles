call plug#begin('~/.vim/bundle')

""" Common
Plug 'Shougo/vimproc', { 'do': 'make' }
Plug 'wincent/ferret', { 'on': ['Ack', 'Acks'] }
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim' " Full path fuzzy file, buffer, mru, tag, finder for Vim
Plug 'godlygeek/tabular' " text filtering and alignment
Plug 'tpope/vim-commentary', { 'tag': 'v1.3' } " comment stuff out
Plug 'tpope/vim-surround' " quoting/parenthesizing made simple
Plug 'moll/vim-bbye' " Delete buffers and close files in Vim without closing your windows
Plug 'itchyny/lightline.vim' " Status bar
Plug 'mengelbrecht/lightline-bufferline' " Bufferline plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""" Languages
Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim.

""" Ruby
" Plug 'vim-ruby/vim-ruby'
" Plug 'thoughtbot/vim-rspec'
" Plug 'tpope/vim-endwise' " wisely add 'end' in ruby, endfunction/endif/more

" Add plugins to &runtimepath
call plug#end()
