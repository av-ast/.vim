" REQUIREMENTS
" brew install ack rust
" gem install rufo
" npm install -g eslint jsxhint
" pip3 install --user neovim jedi psutil setproctitle
" git clone git://github.com/ten0s/syntaxerl.git && cd syntaxerl && make && cp syntaxerl /usr/local/bin
" wget https://raw.githubusercontent.com/z0mbix/sysadmin-tools/master/tfdoc
" https://z0mbix.io/2018/03/28/quickly-access-terraform-docs-from-the-cli-or-vim/
" cargo install racer

call plug#begin()
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'Shougo/echodoc.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'Valloric/MatchTagAlways'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'for': 'markdown', 'do': 'cd app && yarn install'  }
Plug 'tpope/vim-haml', { 'for': 'haml' }
Plug 'tpope/vim-rails', { 'for': ['ruby', 'haml', 'slim', 'javascript'] }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'chase/vim-ansible-yaml'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'bogado/file-line'
Plug 'wfxr/protobuf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'mhinz/vim-signify'
Plug 'rking/ag.vim'
" Plug 'akalyaev/vim-erlang-spec', { 'for': 'erlang' }

Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
Plug 'easymotion/vim-easymotion'
Plug 'iCyMind/NeoSolarized'
Plug 'slim-template/vim-slim', { 'for': 'slim' }

Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }

Plug 'ngmy/vim-rubocop', { 'for': 'ruby' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'ruby-formatter/rufo-vim', { 'for': 'ruby' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'terraform' }
Plug 'neomake/neomake'
Plug 'chr4/nginx.vim', { 'for': 'nginx' }

Plug 'isRuslan/vim-es6', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'Ivo-Donchev/vim-react-goto-definition', { 'for': 'javascript' }
" Plug 'prettier/vim-prettier', {
"       \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'],
"       \ 'do': 'yarn install' }
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'mhinz/vim-crates', { 'for': 'rust' }
Plug 'cespare/vim-toml', { 'for': 'toml' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'thinca/vim-ref'
Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }

call plug#end()

let mapleader = "\<Space>"

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
set updatetime=100
set encoding=utf8
set fillchars+=vert:│
set signcolumn=yes
" don't give |ins-completion-menu| messages.
set shortmess+=c

" set background=light
set background=dark
colorscheme NeoSolarized

" let g:auto_save = 1  " enable AutoSave on Vim startup
inoremap <Esc> <Esc>:w<CR>

" https://github.com/vim/vim/blob/master/runtime/doc/russian.txt
" Enable hotkeys for Russian layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

augroup filetypedetect
    au BufRead,BufNewFile *.es6, *.js, *.jsx set filetype=javascript
    au BufRead,BufNewFile *.slim set filetype=slim
    au BufRead,BufNewFile *.ex,*.exs,*.eex,*.heex set filetype=elixir
    au BufRead,BufNewFile *.hs set filetype=haskell
    au BufRead,BufNewFile *.coffee set filetype=coffee
    au BufRead,BufNewFile *.csv set filetype=csv
    au BufRead,BufNewFile *.tf,*.tfstate,*.tfvars,*.hcl set filetype=terraform
    au BufRead,BufNewFile *.conf set filetype=nginx
    au BufRead,BufNewFile *.py,*.pyc set filetype=python
    au BufRead,BufNewFile *.rs,Cargo.toml set filetype=rust
    au BufRead,BufNewFile *.toml set filetype=toml
    au BufRead,BufNewFile *.rb,Vagrantfile set filetype=ruby
    au BufRead,BufNewFile *.go set filetype=go
    au BufRead,BufNewFile *.ts set filetype=typescript
    au BufRead,BufNewFile *.md set filetype=markdown
    au BufRead,BufNewFile Dockerfile* set filetype=dockerfile
augroup END

au Filetype erlang setlocal tabstop=4
au Filetype erlang setlocal softtabstop=4
au Filetype erlang setlocal shiftwidth=4
au Filetype go setlocal tabstop=4
au Filetype go setlocal softtabstop=4
au Filetype go setlocal shiftwidth=4

let g:vim_json_syntax_conceal = 0

let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "mru"

let g:vim_markdown_folding_disabled = 1

" TERRAFORM
" e.g. :Tfdoc aws_instance
"      :Tfdoc -d aws_instance
if executable('tfdoc')
    command! -nargs=* Tfdoc :call system('tfdoc' . ' ' . <q-args>)
endif

nnoremap <silent> <Leader>tfr :Tfdoc <C-R><C-W><CR>
nnoremap <silent> <Leader>tfd :Tfdoc -d <C-R><C-W><CR>
xnoremap <silent> <Leader>tfr y:Tfdoc <C-R>"<CR>
xnoremap <silent> <Leader>tfd y:Tfdoc -d <C-R>"<CR>

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
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

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

" nnoremap <leader>s :ErlangSpec<CR>

" let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec}\n")'

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

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

""""""""""""""""""
""""""" COC """"""
""""""""""""""""""

" let g:coc_disable_startup_warning = 1

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" Add diagnostic info for https://github.com/itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-lists',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-go',
  \ 'coc-solargraph',
  \ 'coc-elixir',
  \ 'coc-rust-analyzer',
  \ 'coc-emmet',
  \ ]

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" FZF
nmap <C-p> :FZF<CR>

" CtrlSF
nmap <C-F>f <Plug>CtrlSFPrompt
nmap <C-F>n <Plug>CtrlSFCwordPath
nmap <C-F>p <Plug>CtrlSFPwordPath<Paste>

let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

let g:go_def_mapping_enabled = 0

let g:lsc_enable_diagnostics = v:true

nmap <leader>r orequire IEx; IEx.pry<esc>

if has('nvim')
  autocmd BufRead Cargo.toml call crates#toggle()
endif

highlight Crates ctermfg=green ctermbg=NONE cterm=NONE

" ReactJS
noremap <silent> gtd :call ReactGotoDef()<CR>
