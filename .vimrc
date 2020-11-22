set number
set noswapfile
set nobackup
set nowb

set ignorecase
set smartcase
set shiftwidth=2
set tabstop=2

set splitbelow splitright

"SETTING MOUSE FUNCTIONALITY ON VIM
set mouse=nicr

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

call plug#end()

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
noremap <silent> <leader><leader> :FZF<CR>
""""""""""""""""""""""""""""""

let g:auto_sava = 0
let g:auto_save_write_all_buffers = 1
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeAutoDeleteBuffer = 1

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
"""""""""""" SET MOUSE ISSUE""""""""""""""""""""
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

