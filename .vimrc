" Vim basic settings
" ========================================== start =====================================================
set completeopt="menu"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80
set noswapfile
set cursorline
set syntax=on
set guifont=CamingoCode\ 13
set listchars=tab:»\ ,trail:·
set path+=**
set wildmenu
set incsearch
set ic
set foldmethod=indent
let javaScript_fold=3
set foldlevelstart=99
set foldnestmax=10
set nofoldenable
set foldlevel=2
set showtabline=2
set t_Co=256
set termguicolors
set wildmode=longest,list
set nowrap
set textwidth=0
set wrapmargin=0
set splitbelow
set splitright
set lazyredraw
set nobackup
set nowritebackup
" Set autoupdate for opened files
set autoread
" au BufNewFile,BufRead *.html set filetype=ejs
" Active line highlight
let g:conoline_color_normal_light = "cterm=240"
let g:conoline_color_normal_nr_light = "ctermbg=240 ctermfg=white"
let g:conoline_color_insert_light = "ctermbg=black"
let g:conoline_color_insert_nr_light = "ctermbg=red"
let mapleader=","

let g:netrw_banner = 0

execute "source" "~/.vim/autoload/relative_number_mappings.vim"

" vim-polyglot
" ========================================== start =====================================================
let g:polyglot_disabled = ['acpiasl']

" Plugins Installation
" ========================================== start ============================
call plug#begin('~/.vim/plugged')
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'junegunn/vim-easy-align'
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-surround'
	Plug 'scrooloose/nerdcommenter'
	Plug 'mattn/emmet-vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'nikvdp/ejs-syntax'
	Plug 'morhetz/gruvbox'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" CTRP
" ========================================== start =====================================================
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_files=10
let g:ctrlp_max_depth=40
let g:ctrlp_match_window = 'min:4,max:35'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set rtp+=~/.fzf

" vim-airline
" ========================================== start =====================================================
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'


" nnoremap
" ========================================== start =====================================================
" Buffers controls
""""""""""""""""""""""""""""""
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
""""""""""""""""""""""""""""""
nnoremap <F3> :set list!<CR>
nnoremap <silent> <Leader>r :call mappings#cycle_numbering()<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
" Drop hilighting for search results
nnoremap <leader>. :noh<CR>


" inoremap
" ========================================== start =====================================================
inoremap kj <esc>
inoremap <esc> <nop>

" cnoremap
" ========================================== start =====================================================
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" onoremap
" ========================================== start =====================================================
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in) :<c-u>normal! f)vi(<cr>
onoremap il( :<c-u>normal! F(vi(<cr>
onoremap il) :<c-u>normal! F)vi(<cr>

" GIT
" ========================================== start =====================================================
highlight GitGutterAdd    guifg=#009900 guibg=#1D1F21 ctermfg=2 ctermbg=green
highlight GitGutterChange guifg=#bbbb00 guibg=#1D1F21 ctermfg=3 ctermbg=white
highlight GitGutterDelete guifg=#ff2222 guibg=#1D1F21 ctermfg=1 ctermbg=red

if &diff
    highlight! link DiffText MatchParen
endif

" statusline
" ========================================== start =====================================================
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" EasyAlign
" ========================================== start =====================================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" colorscheme
" ========================================== start =====================================================
" colorscheme wombat256mod
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
let g:gruvbox_italic=1
let g:gruvbox_italicize_strings=1
set background=dark


let g:enable_bold_font = 0
let g:enable_italic_font = 0
if (has("termguicolors"))
  set termguicolors
endif

" another maybe unused
let g:javascript_plugin_jsdoc = 1

nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" set vim to chdir for each file
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif

" CoC
" ============================= start ==========================
let g:coc_global_extentions = [
	\ 'coc-tsserver',
	\ 'coc-prettier',
	\ 'coc-html-css-support',
	\ 'coc-html',
	\ 'coc-eslint',
	\ 'coc-cssmodules',
	\ 'coc-yaml',
	\ 'coc-xml',
	\ 'coc-swagger',
	\ 'coc-sh',
	\ 'coc-json',
	\ 'coc-java',
	\ 'coc-htmlhint',
	\ 'coc-golines',
	\ 'coc-go',
	\ 'coc-docker',
	\ 'coc-css'
	\ ]
" ============================== end ===========================
"
