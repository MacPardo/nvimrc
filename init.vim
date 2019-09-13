:set expandtab tabstop=2 shiftwidth=2
:set clipboard+=unnamedplus

:set relativenumber
:set number
:set mouse=a
:set nowrap
set textwidth=64

:let mapleader=","

function! s:MyPythonConfigs()
  set tabstop=4
  set shiftwidth=4
endfunction

function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function Testing()
  echom("hello")
  tabnew
endfunc

call plug#begin('~/.vim/plugged')

Plug 'justinmk/vim-sneak'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'junegunn/vim-easy-align'
Plug 'rhysd/vim-clang-format'
Plug 'leafgarland/typescript-vim'
Plug 'idris-hackers/idris-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

call plug#end()

let g:sneak#label = 1

tnoremap <C-[> <C-\><C-n>
tnoremap <C-l> <C-\><C-n>

nnoremap tn :tabnew 
nnoremap tN :tabnew<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprevious<CR>
nnoremap tJ :tabm -1<CR>
nnoremap tK :tabm +1<CR>
nnoremap tl :tablast<CR>
nnoremap th :tabfirst<CR>
nnoremap tH :call MoveToPrevTab()<CR>
nnoremap tL :call MoveToNextTab()<CR>

nnoremap <C-j> 4<C-e>
nnoremap <C-k> 4<C-y>

nnoremap <C-l> :noh<CR>
nnoremap vimrc :e ~/.config/nvim/init.vim<CR>

nnoremap <leader>f :ClangFormat<CR>
"let g:clang_format#auto_format = 1
let g:clang_format#code_style = "Google"

inoremap <C-l> <Esc>

"ayu
"gruvbox
"colorscheme dracula
set termguicolors
let ayucolor="dark"
colorscheme ayu

"autocmd vimenter * NERDTree

"autocmd StdinReadPre * let s:std_in=1
"utocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

nnoremap nto :NERDTree<CR>
nnoremap ntc :NERDTreeClose<CR>


xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
