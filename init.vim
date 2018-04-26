" REQUIREMENTS
" npm install -g eslint jsxhint
" pip3 install --user neovim jedi psutil setproctitle
" git clone git://github.com/ten0s/syntaxerl.git && cd syntaxerl && make && cp syntaxerl /usr/local/bin

call plug#begin()
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Shougo/echodoc.vim'

Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'Valloric/MatchTagAlways'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-git'
Plug 'tpope/vim-rails', { 'for': ['ruby', 'haml', 'slim', 'javascript'] }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'chase/vim-ansible-yaml'
Plug 'kien/rainbow_parentheses.vim'
Plug 'vim-scripts/paredit.vim'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'bogado/file-line'

Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug '907th/vim-auto-save'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'mhinz/vim-signify'
Plug 'rking/ag.vim'
Plug 'akalyaev/vim-erlang-spec', { 'for': 'erlang' }

Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'jgdavey/tslime.vim'
Plug 'vim-erlang/vim-erlang-runtime', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-compiler', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-omnicomplete', { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-tags', { 'for': 'erlang' }
Plug 'easymotion/vim-easymotion'
Plug 'iCyMind/NeoSolarized'
Plug 'slim-template/vim-slim', { 'for': 'slim' }

Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'isRuslan/vim-es6', { 'for': 'javascript' }

Plug 'roxma/nvim-completion-manager'
Plug 'roxma/nvim-cm-tern',  { 'for': 'javascript', 'do': 'npm install' }
Plug 'roxma/ncm-flow',  { 'for': 'javascript', 'do': 'npm install' }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'eugen0329/vim-esearch'
" Plug 'sbdchd/neoformat'
Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }

call plug#end()

filetype off
filetype plugin indent on
syntax on

if has('mouse')
  set mouse=a
endif

set termguicolors

" Don't redraw while executing macros (good performance config)
set lazyredraw
set ttyfast

set cursorline
set hidden
set expandtab
set tabstop=2
set shiftwidth=2
set clipboard+=unnamed
set number

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set noswapfile
set nowritebackup
set nobackup
set nowb

set showcmd       " display incomplete commands
set autowrite     " Automatically :write before running commands

set splitbelow
set cmdheight=2

set hlsearch
set ignorecase
set smartcase
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
set encoding=utf8
set fillchars+=vert:│

set background=light
" set background=dark
colorscheme NeoSolarized

let g:auto_save = 1  " enable AutoSave on Vim startup

" https://github.com/vim/vim/blob/master/runtime/doc/russian.txt
" Enable hotkeys for Russian layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

au Filetype erlang setlocal tabstop=4
au Filetype erlang setlocal softtabstop=4
au Filetype erlang setlocal shiftwidth=4

augroup filetypedetect
    au BufRead,BufNewFile *.es6 set filetype=javascript
    au BufRead,BufNewFile *.slim set filetype=slim
    au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
augroup END

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

let g:vim_json_syntax_conceal = 0

let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "mru"

let g:vim_markdown_folding_disabled = 1

let g:syntastic_check_on_open = 1
let g:syntastic_javascript_checkers = ['eslint', 'jsxhint']
let g:syntastic_erlang_checkers = ['syntaxerl']

" Map ctrl-movement keys to window switching
nmap <C-k> <C-w><Up>
nmap <C-j> <C-w><Down>
nmap <C-l> <C-w><Right>
nmap <C-h> <C-w><Left>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" NERDTree
nmap <C-\> :NERDTreeFind<CR>
nmap <C-t> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=25

nmap <silent> // :nohlsearch<CR>
noremap ,hl :set hlsearch! hlsearch?<CR>

" Allows you to enter sudo pass and save the file
" " when you forgot to open your file with sudo
cmap w!! %!sudo tee > /dev/null %

" Allow to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Lines moving
" ∆ means <Alt+j>
" ˚ means <Alt+k>

" Normal mode
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

" Insert mode
inoremap ∆ <ESC>:m .+1<CR>==gi
inoremap ˚ <ESC>:m .-2<CR>==gi

" Visual mode
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" set iskeyword-=_

nnoremap <leader>s :ErlangSpec<CR>

let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec}\n")'

" vim-rspec mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

let g:esearch = {
  \ 'adapter':    'ag',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}
