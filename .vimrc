set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80
set number
set noswapfile
set cursorline
set syntax=on
set guifont=Monofour\ 14
set list listchars=tab:»\ ,trail:·
set path+=**
set wildmenu
set incsearch
set ic
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
set showtabline=2
set t_Co=256
set runtimepath^=~/.vim/bundle/ctrlp.vim
set termguicolors
set wildmode=longest,list
set nowrap
set textwidth=0
set wrapmargin=0
au BufNewFile,BufRead *.html set filetype=ejs

" Active line highlight
let g:conoline_color_normal_light = "cterm=240"
let g:conoline_color_normal_nr_light = "ctermbg=240 ctermfg=white"
let g:conoline_color_insert_light = "ctermbg=black"
let g:conoline_color_insert_nr_light = "ctermbg=red"

" Plugins installation
call plug#begin('~/.vim/plugged')
	"""""" FileSystem
	Plug 'scrooloose/nerdtree'
	Plug 'airblade/vim-gitgutter'
	"""""" Colors etc.
	Plug 'vim-airline/vim-airline-themes'
	"""""" Helpers
	Plug 'junegunn/vim-easy-align'
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-surround'
	Plug 'scrooloose/nerdcommenter'
	Plug 'mattn/emmet-vim'
	Plug 'sheerun/vim-polyglot'
	"""""" JS/Json
	Plug 'valloric/youcompleteme'
	"""""" CSS/LESS/SASS/HTML/Jade
	Plug 'nikvdp/ejs-syntax'
	"""""" Errors
call plug#end()

" FileSystem
"""""""""""" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
nmap <F6> :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"""""""""""" CTRP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Helpers settings
"""""""""""" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
"""""""""""" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

colorscheme wombat256mod
let g:enable_bold_font = 1
let g:enable_italic_font = 1
if (has("termguicolors"))
  set termguicolors
endif

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_mode_map = {
  \ '__' : '-',
  \ 'c'  : 'C',
  \ 'i'  : 'I',
  \ 'ic' : 'I',
  \ 'ix' : 'I',
  \ 'n'  : 'N',
  \ 'ni' : 'N',
  \ 'no' : 'N',
  \ 'R'  : 'R',
  \ 'Rv' : 'R',
  \ 's'  : 'S',
  \ 'S'  : 'S',
  \ '' : 'S',
  \ 't'  : 'T',
  \ 'v'  : 'V',
  \ 'V'  : 'V',
  \ '' : 'V',
  \ }
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
function! AirlineInit()
	let g:airline_section_a = airline#section#create(['mode'])
	let g:airline_section_b = airline#section#create(['branch'])
	let g:airline_section_x = airline#section#create(['%P'])
	let g:airline_section_y = airline#section#create(['%B'])
	let g:airline_section_z = airline#section#create_right(['%l','%c'])
endfunction
autocmd VimEnter * call AirlineInit()

highlight GitGutterAdd    guifg=#009900 guibg=#1D1F21 ctermfg=2 ctermbg=green
highlight GitGutterChange guifg=#bbbb00 guibg=#1D1F21 ctermfg=3 ctermbg=white
highlight GitGutterDelete guifg=#ff2222 guibg=#1D1F21 ctermfg=1 ctermbg=red
set rtp+=~/.fzf
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Buffers controls
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

let g:javascript_plugin_jsdoc = 1
let g:ycm_filepath_blacklist = {}
set completeopt-=preview

if &diff
    highlight! link DiffText MatchParen
endif

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
