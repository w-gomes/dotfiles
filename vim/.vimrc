" Settings
set nocompatible "Use vim, not vi api
filetype off


" Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'pbrisbin/vim-mkdir'
Plug 'justinmk/vim-sneak'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'nanotee/zoxide.vim'
Plug 'ziglang/zig.vim'
call plug#end()
filetype plugin indent on


" Basic options
syntax on
set encoding=utf-8
set fileencodings=utf-8
set nobackup
set nowritebackup
set cmdheight=1 "give more space for displaying messages.
set updatetime=300
set shortmess+=c
set noswapfile
set history=200 "Command history
set ruler "Always show cursor
set showcmd "Show incomplete commands
set incsearch "Incremental search (search as you type)
set hlsearch
set smartcase
set ignorecase
set hidden
set backspace=indent,eol,start
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set number
set timeout timeoutlen=1000 ttimeoutlen=100 "Get rid of the delay when pressing 0 (for example)
set laststatus=2
set autoread
set formatoptions-=cro "Disable auto comments on new lines
set splitbelow
set splitright
set visualbell
set wildmenu
set lazyredraw
set showmatch
set noshowmode
set autoindent
set smartindent
set cindent
set mouse=a
set rnu
set title
set nowrap
set scrolloff=2
set sidescrolloff=2
set list
set listchars=tab:\ \ ,trail:·,extends:>,precedes:<,nbsp:~ "Highlight tailing whitespace

set wildignore+=*.o,*.obj
set wildignore+=*.ilk
set wildignore+=*/build/*
set wildignore+=*/build_native/*
set wildignore+=*/build-*/*
set wildignore+=moc_*.cpp,moc_*.h,moc_*.hpp
set wildignore+=*/target/debug/*
set wildignore+=*/target/release/*
set wildignore+=*/target/*
set wildignore+=*/vendor/*
set wildignore+=*/__pycache__/*,*/venv/*,*.pyc
set wildignore+=*/node_modules/*,*/dist/*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe
set wildignore+=.git,.hg,.svn,*/doc/*html

" Linux specific option
if has("unix")
  set clipboard=unnamedplus,unnamed "Use system clipboard
endif

" Colorscheme
set t_Co=256
set termguicolors

colorscheme pixelmuerto

let g:lightline = { 'colorscheme': 'simpleblack', }


"-----------------------------------------------------------------------------
" Mappings

" Remapping leader
let mapleader = "\<Space>"

" Use ; as :
" nnoremap ; :

nnoremap Q <nop>

map <leader>w :w<CR>

map <F1> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>
map <F4> :UndotreeToggle<CR>

nnoremap <silent> <ESC><ESC> :noh<CR>
nnoremap <silent> \\ :noh<CR>

" Disabling arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"Disabling arrow keys in insert mode too
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"move lines up and down
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==

"keep cursor centered
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
nmap n nzzzv
nmap N Nzzzv

"moving between buffers
nnoremap <silent> <F5> :bprev<CR>
nnoremap <silent> <F6> :bnext<CR>
nnoremap <silent> <F7> :bfirst<CR>
nnoremap <silent> <F8> :blast<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Make splitting Vim windows easier
nnoremap <leader>s <C-W>s
nnoremap <leader>v <C-W>v

" space+y = yank to clipboard
" space+p = paste to clipboard
vnoremap <silent> <leader>y "+y
vnoremap <silent> <leader>p "+p
nnoremap <silent> <leader>p "+p

" special paste and delete
xnoremap <leader>p "_dP
nnoremap <leader>d "_d

" Tab
nnoremap <S-t> :tabnew<CR>
nnoremap <S-c> :tabc<CR>
nnoremap <S-l> gt
nnoremap <S-h> gT

" Replace real line keys for display line
" when going up and down
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" fzf commands
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Changes<CR>
nnoremap <leader>fr :Rg<CR>
nnoremap <leader>fh :History<CR>

"nnoremap <leader>fbl :BLines<CR>
"nnoremap <leader>fg? :GFiles?<CR>
"nnoremap <leader>fm :Marks<CR>
"nnoremap <leader>fbm :BMarks<CR>


"-----------------------------------------------------------------------------
" Plugins configs

" zig.vim
let g:zig_fmt_autosave = 0

" fzf
let g:fzf_vim = {}
let g:fzf_vim.preview_window = []
