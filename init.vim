:set expandtab tabstop=4 shiftwidth=4
:set clipboard+=unnamedplus

:set relativenumber
:set number

call plug#begin('~/.vim/plugged')

Plug 'justinmk/vim-sneak'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'phpactor/phpactor'

call plug#end()

let g:sneak#label = 1

tnoremap <C-[> <C-\><C-n>

nnoremap tn :tabnew 
nnoremap tk :tabnext<CR>
nnoremap tj :tabprevious<CR>
nnoremap tl :tablast<CR>
nnoremap th :tabfirst<CR>

nnoremap <C-j> 4<C-e>
nnoremap <C-k> 4<C-y>

nnoremap <C-l> :noh<CR>

colorscheme molokai

autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


