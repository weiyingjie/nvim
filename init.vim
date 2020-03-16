" __  ____   __  _   ___     _____ __  __ ____   ____ 
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |    
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___ 
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
                                                     
" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader=" "
syntax on

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on


"代码补全
"set completeopt=preview,menu
set mouse=a
set number
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase	
set autoindent  
set relativenumber	" 行号 "
set cursorline	" 光标线 "
set wrap	" 自动换行 "
set showcmd	" 指令 "
set wildmenu
set hlsearch	" 搜索高亮 "
exec "nohlsearch"
set incsearch	" 边搜索边高亮 "
set cindent  
set backspace=indent,eol,start " 设置退格生效
set t_Co=256
set scrolloff=5
hi Normal ctermfg=252 ctermbg=none
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif

" 记录光标位置
augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

noremap W :wa<CR>
noremap Q :q<CR>

noremap <F7> :NERDTreeToggle<CR>
noremap <F8> :TagbarToggle<CR>
noremap <F9> :MarkdownPreview<CR>

inoremap <C-l> <Right>
inoremap <C-h> <Left>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap "" ""<++><ESC>4hi
inoremap '' ''<++><ESC>4hi
inoremap {} {}<ESC>i<CR><ESC><Up>o
inoremap () ()<++><ESC>4hi
inoremap <> <><++><ESC>4hi
inoremap [] []<++><ESC>4hi
inoremap ,f <ESC>f<c4l


map R :source $MYVIMRC<CR>
map s <nop>

map sd :set splitright<CR>:vsplit<CR>
map sa :set nosplitright<CR>:vsplit<CR>
map sw :set nosplitbelow<CR>:split<CR>
map ss :set splitbelow<CR>:split<CR>

map <LEADER>l <C-w>l
map <LEADER>k <C-w>k
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j

map <C-up> :res +5<CR>
map <C-down> :res -5<CR>
map <C-left> :vertical resize-5<CR>
map <C-right> :vertical resize+5<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map tl :tabnext<CR>
map th :tabprevious<CR>
map tn :tabnew 

map \f :Format<CR>

"plugins"
call plug#begin('~/.config/nvim/plugged')

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }

" NerdTree
Plug 'preservim/nerdtree'

" YouCompleteMe
Plug 'ycm-core/YouCompleteMe'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Startify
Plug 'mhinz/vim-startify'

" Devicons
Plug 'ryanoasis/vim-devicons'

" Tagbar(need ctags)
Plug 'majutsushi/tagbar'

call plug#end()

"theme"
colorscheme dracula
"opacity
hi Normal ctermfg=252 ctermbg=none
" let g:SnazzyTransparent = 1
" color snazzy

"airline"
"let g:airline_theme='base16_spacemacs'
" enable/disable enhanced tabline. (c) >
let g:airline#extensions#tabline#enabled = 1

" enable/disable displaying open splits per tab (only when tabs are opened) >
let g:airline#extensions#tabline#show_splits = 1
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
set laststatus=2  "永远显示状态栏

let g:airline#extensions#ycm#enabled = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

"" unicode symbols
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = 'Ɇ'
"let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
"NERDTree"

"autocmd vimenter * NERDTree 自动打开

let NERDTreeShowHidden=1

let NERDTreeWinSize = 25

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

"YouCompleteMe"
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>

let g:ycm_server_python_interpreter='/usr/bin/python2'
let g:ycm_global_ycm_extra_conf='~/.config/nvim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_auto_trigger = 1
let g:ycm_seed_identifiers_with_syntax = 1

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'google-chrome-stable'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
