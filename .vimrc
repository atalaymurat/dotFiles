set number
set noswapfile
set nobackup
set nowb

set shiftwidth=2
set tabstop=2
set cursorline

set splitbelow splitright
set showcmd "show pressed keys
set textwidth=100 "set lines to wrap (number of cols)

"Search Settings
set hlsearch "highlight all search results
set smartcase
set ignorecase
set incsearch
let g:CoolTotalMatches = 1 "Show number of matches in cli

"Removes | pipes 
set fillchars+=vert:\ 
call plug#begin()
set laststatus=2

Plug 'scrooloose/nerdtree', {'on':  'NERDTreeToggle'}
Plug 'tpope/vim-sensible'
Plug 'vimwiki/vimwiki'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug '907th/vim-auto-save'
Plug 'neoclide/coc.nvim'
Plug 'junegunn/fzf'
Plug 'sollidsnake/vterm'
Plug 'itchyny/lightline.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier'
Plug 'romainl/vim-cool' "disables search highlights
Plug 'tomasiser/vim-code-dark' "VS CODE THEME COLORS

call plug#end()

""THEME SETTINGS
set background=dark
colorscheme codedark

""KEY MAPPING
noremap <SPACE> <Nop>
let mapleader = " "
map <Leader>tt :VTermStart<CR>
map <C-n> :NERDTreeToggle<CR>
nmap <silent><leader>w :wqa<cr>
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>
noremap <silent> <leader><SPACE> :FZF<CR>

""EMMET SETTINGS""""""""""""""""""""""""""""
let g:user_emmet_leader_key=","
let g:user_emmet_settings = {
	\ 'javascript.jsx' : {
		\		'extends' : 'jsx',
  	\ },
	\}
""FZF SETTINGS"""""""""""""""""""""""""""""""
let g:fzf_action = {
	\ 'ctrl-i': 'split',
	\ 'ctrl-t': 'tabedit',
	\ 'ctrl-s': 'vsplit',
	\ }

let g:auto_save = 0
let g:auto_save_write_all_buffers = 1
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeIgnore = ['^node_modules$']

""PRETTIER Settings""""""""""""""""""""""""""""
let g:prettier#quickfix_auto_focus = 0
let g:prettier#autoformat = 0

"Persistent_undo feature.
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/.config/vim-persisted-undo/')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    " point Vim to the defined undo directory.
    let &undodir = target_path
    " finally, enable undo persistence.
    set undofile
endif

"""""""""""" COC CONFIGURATION""""""""""""""""""""
"COC Navigate with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

"""""""""""" SET MOUSE ISSUE""""""""""""""""""""
"SETTING MOUSE FUNCTIONALITY ON VIM
set mouse=nicr
set ttymouse=sgr

"Ignoring useless files for wildmenu
set wildignore+=*.a,*.o,*.so,*.pyc,.git
set wildignore+=*.jpg,*.png,*.gif,*.bmp,*.ico,*.pdf
set wildignore+=*.tmp,*.swp

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

