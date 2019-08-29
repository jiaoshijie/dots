"                                                                           
"      _ ___ _____ _ ____    _   _ _____ _____     _____ __  __ ____   ____ 
"     | |_ _| ____( ) ___|  | \ | | ____/ _ \ \   / /_ _|  \/  |  _ \ / ___|
"  _  | || ||  _| |/\___ \  |  \| |  _|| | | \ \ / / | || |\/| | |_) | |    
" | |_| || || |___   ___) | | |\  | |__| |_| |\ V /  | || |  | |  _ <| |___ 
"  \___/|___|_____| |____/  |_| \_|_____\___/  \_/  |___|_|  |_|_| \_\\____|
"  git clone https://github.com/junegunn/vim-plug
"  ~/.config/nvim/autoload
"                                                                           

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
set clipboard+=unnamedplus
set colorcolumn=80

" set leader
" let mapleader=','
let mapleader=' '
let maplocalleader='\\'

" set themes
set background=dark
" colorscheme snazzy
colorscheme gruvbox8
" let g:SnazzyTransparent = 1
let g:gruvbox_transp_bg = 1
let &t_ut=''

" display
set number
set relativenumber
set wrap
set tw=0
set cursorline
set ruler
set list
set listchars=trail:▫,tab:
set scrolloff=6

" search
exec 'nohlsearch'
set ignorecase
set smartcase

" tab
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
" 代码格式化的一些选项
set formatoptions-=tc

" auto to dir
set autochdir

" show commend meun
set wildmode=longest,list,full
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc

" split window behaviors
set splitright
set splitbelow

" 打开自动定位到上次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" vim mapings
" SOS
cnoremap w!! w !sudo tee %
" normal mode mapings
nnoremap s :w<cr>
nnoremap S :source ~/.config/nvim/init.vim<cr>
nnoremap Q :q<cr>
nnoremap <leader><cr> :nohl<cr>
nnoremap J 6j
nnoremap K 6k
nnoremap H 0
nnoremap L $
nnoremap <leader>p "+p
    " window mapings
nnoremap <leader><Up> <C-w>v
nnoremap <leader><down> <C-w>s
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
nnoremap <Left> <C-w>>
nnoremap <Right> <C-w><
" nnoremap <leader><Left> <C-w>t<C-w>H
" nnoremap <leader><Right> <C-w>t<C-w>K
    " buffer mapings
nnoremap <leader><Left> :bprevious<cr>
nnoremap <leader><Right> :bnext<cr>
nnoremap <leader>f /<++><cr>:nohlsearch<cr>c4l

" inster mode mapings
inoremap jk <Esc>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>0i
inoremap <C-d> <del>


" visual mode mapings
vnoremap H 0
vnoremap L $
vnoremap <leader>p "+p

" vim 插件
call plug#begin('~/.config/nvim/plugged')

" 代码补全插件(自动)
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-clangx'
Plug 'zchee/deoplete-jedi'

" 缩进显示插件(自动)
Plug 'nathanaelkane/vim-indent-guides'

" 代码缩进提示(自动)
Plug 'yggdroot/indentline'

" 下方的提示条美化插件(自动)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'lifepillar/vim-gruvbox8'

" vim启动美化插件(自动)
Plug 'mhinz/vim-startify'

" 目录树(手动)
Plug 'scrooloose/nerdtree'

" 模糊搜索插件(手动)
Plug 'kien/ctrlp.vim'

" 查看代码定义(手动)
Plug 'majutsushi/tagbar'

" 高亮感兴趣的单词(手动)
Plug 'lfv89/vim-interestingwords'

" 格式化代码(手动)
Plug 'sbdchd/neoformat'

" 静态检查代码，显示错误(自动)
Plug 'w0rp/ale'

" 括号补全插件
Plug 'Raimondi/delimitMate'

call plug#end()

" deoplete.nvim
let g:deoplete#enable_at_startup = 1

" NERDTree
nnoremap tt :NERDTreeToggle<cr>

" ctrlp
let g:ctrlp_map = '<c-p>'

" airline
" let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '¶'
let g:airline_theme='light'
