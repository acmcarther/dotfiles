filetype on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/matchit'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'blarghmatey/split-expander'
Plugin 'sjl/vitality.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-endwise'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'vim-scripts/tComment'
Plugin 'tomtom/tlib_vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-haml'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'dkprice/vim-easygrep'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'takac/vim-hardtime'
Plugin 'slim-template/vim-slim'
Plugin 'wting/rust.vim'

Plugin 'myusuf3/numbers.vim'

Plugin 'kikijump/tslime.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'

Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'

call vundle#end()
filetype plugin indent on

syntax enable
set list listchars=tab:»·,trail:·
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_degrade=0
let g:solarized_visibility="normal"
set background=dark
colorscheme solarized

set laststatus=2
let g:airline#extensions#tabline#enabled=1

set directory=$HOME/.vim/swapfiles//

let g:syntastic_ruby_checkers  = ['mri']
let g:syntastic_enable_highlighting=0

" Maybe fix slim
autocmd FileType slim setlocal foldmethod=indent
autocmd BufNewFile,BufRead *.slim set filetype=slim

" Fix rust
autocmd FileType rust setlocal shiftwidth=2 tabstop=2

" Fix coffee
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easier window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Remap colon to semicolon
nnoremap ; :

" Split below and right
set splitbelow
set splitright

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Numbers
set number
set numberwidth=3

" Case stuff
set smartcase
set ignorecase
set noantialias

set nocompatible
set backspace=2
set nobackup
set ruler
set showcmd

" Search
set incsearch
set hlsearch
set autowrite

" Highlight characters over 80 col
highlight LineTooLong ctermbg=darkgray ctermfg=black
call matchadd('LineTooLong', '\%81v', 100)
                                                                                                                                                                 "
" Leader
let mapleader = " "
" Toggle nerdtree with F10
map <F10> :NERDTreeToggle<CR>

" Current file in nerdtree
map <F9> :NERDTreeFind<CR>

" Reduce timeout after <ESC> is recvd. This is only a good idea on fast links.
set ttimeout
set ttimeoutlen=20
set notimeout

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" highlight vertical column of cursor
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline
set cursorline

"key to insert mode with paste using F2 key
map <F2> :set paste<CR>i
" Leave paste mode on exit
au InsertLeave * set nopaste

" Command aliases
cabbrev tp tabprev
cabbrev tn tabnext
cabbrev tf tabfirst
cabbrev tl tablast

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Cursor highlight
hi CursorLineNr guifg=#050505

" Airline
let g:airline_theme='solarized'
set t_Co=256

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup
  let g:grep_cmd_opts = '--line-numbers --noheading'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to search word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
let g:rspec_runner = "os_x_iterm"

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

autocmd BufRead,BufNewFile *.rs set filetype=rust
