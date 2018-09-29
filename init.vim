:set expandtab tabstop=4 shiftwidth=4
:set clipboard+=unnamedplus

:set relativenumber
:set number

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
nnoremap tH :call MoveToPrevTab()<CR>
nnoremap tL :call MoveToNextTab()<CR>

nnoremap <C-j> 4<C-e>
nnoremap <C-k> 4<C-y>

nnoremap <C-l> :noh<CR>
nnoremap vimrc :e ~/.config/nvim/init.vim<CR>

inoremap <C-k> <Space><Space>

colorscheme molokai

autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
