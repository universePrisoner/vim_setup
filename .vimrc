set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80
set number
set relativenumber
set noswapfile
" set cursorline
set syntax=on
set guifont=Monofour\ 14
set list listchars=tab:»\ ,trail:·

call plug#begin('~/.vim/plugged')
	Plug 'junegunn/vim-easy-align'
	Plug 'tpope/vim-surround'
	Plug 'scrooloose/nerdtree'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'pangloss/vim-javascript'
call plug#end()

" Plugin settings: vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set t_Co=16
color dracula

" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
