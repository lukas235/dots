" Get the defaults that most users want.
"source $VIMRUNTIME/defaults.vim
syntax on
filetype plugin on
filetype indent on
set t_Co=256

" Set to auto read when a file is changed from the outside
set autoread

" Modern search
set incsearch
set hlsearch
set ignorecase

" Show matching brackets
set showmatch
set mat=2

" Appearance
set number
set relativenumber
"set ruler

" No insert/normal etc bc we have airline
set noshowmode

set mouse=a

" Use spaces
set expandtab
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set nowrap
set textwidth=0


" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Key Maps
vnoremap Y "+y


" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Gruv
"let g:gruvbox_contrast_dark='soft'
"let g:gruvbox_contrast_light='hard'
"let g:gruvbox_italic=1
"let g:solarized_termtrans=1
"let g:solarized_contrast="normal"
"let g:solarized_visibility="normal"
colorscheme solarized
set background=dark
"highlight Normal ctermbg=None

map <C-n> :NERDTreeToggle<CR>
call plug#begin()
"Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'justinmk/vim-sneak'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vimwiki/vimwiki'
call plug#end()

