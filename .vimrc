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
set guifont=Monofour\ 14
set listchars=tab:»\ ,trail:·
set path+=**
set wildmenu
set incsearch
set ic
set foldmethod=syntax
let javaScript_fold=1
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
au BufNewFile,BufRead *.html set filetype=ejs
" Active line highlight
let g:conoline_color_normal_light = "cterm=240"
let g:conoline_color_normal_nr_light = "ctermbg=240 ctermfg=white"
let g:conoline_color_insert_light = "ctermbg=black"
let g:conoline_color_insert_nr_light = "ctermbg=red"
let mapleader="-"

" Plugins Installation
" ========================================== start =====================================================
call plug#begin('~/.vim/plugged')
	Plug 'airblade/vim-gitgutter'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'junegunn/vim-easy-align'
	Plug 'vim-airline/vim-airline'
	Plug 'tpope/vim-surround'
	Plug 'scrooloose/nerdcommenter'
	Plug 'mattn/emmet-vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'prettier/vim-prettier', { 'do': 'npm install', }
	Plug 'w0rp/ale'
	Plug 'nikvdp/ejs-syntax'
	Plug 'Valloric/YouCompleteMe'
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

" ALE
" ========================================== start =====================================================
let b:ale_linters = ['eslint', 'prettier']
let g:ale_completion_enabled = 1
let g:ale_linters_explicit = 1
let g:ale_sign_error = '!'
let g:ale_sign_warning = '*'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_set_highlights = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
highlight clear ALEErrorSign
highlight clear ALEWarningSign

" nnoremap
" ========================================== start =====================================================
" Buffers controls
"""""""""""""""""""""""""""""" 
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
"""""""""""""""""""""""""""""" 
" YouCompleteMe controls
"""""""""""""""""""""""""""""" 
nnoremap <leader><space>gd :YcmCompleter GoToDefinition<cr>
nnoremap <leader><space>gt :YcmCompleter GoToType<cr>
nnoremap <leader><space>gr :YcmCompleter GoToReferences<cr>
nnoremap <leader><space>t :YcmCompleter GetType<cr>
nnoremap <leader><space>d :YcmCompleter GetDoc<cr>
nnoremap <leader><space>o :YcmCompleter OrganizeImports<cr>
"""""""""""""""""""""""""""""" 
nnoremap <F3> :set list!<CR>
nnoremap <silent> <Leader>r :call mappings#cycle_numbering()<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>; mqA;<esc>'q


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
onoremap in) :<c-u>normal! F)vi(<cr>

"  Prettier
" ========================================== start =====================================================
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

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
colorscheme wombat256mod
let g:enable_bold_font = 1
let g:enable_italic_font = 1
if (has("termguicolors"))
  set termguicolors
endif

" vim-polyglot
" ========================================== start =====================================================
let g:polyglot_disabled = ['acpiasl']

" another maybe unused
let g:javascript_plugin_jsdoc = 1

" LEARNING - MUST BE DELETED
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'
