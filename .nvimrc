call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'git@github.com:OmniSharp/omnisharp-vim.git'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/echodoc.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'dense-analysis/ale'
Plug 'git@github.com:preservim/nerdcommenter.git'
Plug 'https://github.com/tpope/vim-eunuch.git'
Plug 'https://github.com/abecodes/tabout.nvim.git'
Plug 'https://github.com/tpope/vim-surround.git' 
Plug 'https://github.com/preservim/nerdtree.git'
call plug#end()

" Imports --------------------------------------------------

for f in split(glob(path . '\config\*.vim'), '\n')
    exe 'source' f
endfor

" Settings --------------------------------------------------

syntax enable
colorscheme onedark

set nocompatible
let g:mapleader = ','
let g:maplocalleader = ','
let &shell='bash.exe'
set shell=cmd.exe
set numberwidth=8
set so=999
set laststatus=2
set noshowmode
set autoread
set noswapfile
set nobackup
set nowb
set cursorline
set tabstop=3
set shiftwidth=3
set expandtab
let g:EasyMotion_smartcase = 1
set switchbuf=newtab
set modifiable
set clipboard+=unnamedplus
set mouse=a
set viminfo='100,<0,s10,h "Remove Registers
hi Quote ctermbg=109 guifg=#83a598
highlight LineNr gui=bold guifg=grey
filetype plugin on
let g:autoclose_on = 0

source $VIMRUNTIME/mswin.vim
behave mswin

" Number System ----------------------

set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Commands ---------------------------

command Reload :so $MYVIMRC
command RS :OmniSharpRestartAllServers

" Hotkeys ----------------------------

nnoremap <C-s> :w<CR>
nnoremap <C-b> :<C-u>Buffers<CR>
" nnoremap <silent> <M-f> :OmniSharpCodeFormat<CR> <bar> :g/^$/de<cr> <bar> :%s/\(^\s*private.*{$\)/\r\1/e<cr> <bar> :%s/\(^\s*protected.*{$\)/\r\1/e<cr> <bar> :%s/\(^\s*public.*{$\)/\r\1/e<cr> <bar> :%s/namespace/\rnamespace<cr>
"nnoremap <silent> <M-f> :OmniSharpCodeFormat<CR> <bar> :g/^$/de<cr> 
nnoremap <C-f> :OmniSharpCodeFormat<CR> 
"nnoremap <M-o> <Plug>(omnisharp_find_symbol)
nnoremap <M-u> :OmniSharpFixUsings<CR>
nmap <space> <Plug>(easymotion-bd-w)
nnoremap <M-o>  :<C-u>CocList outline<CR>
vnoremap <C-h> :s/
nnoremap <esc> :noh<return><esc>
" Jump to the end in INSERT mode
inoremap <C-e> <C-o>A 
nmap <C-/>   <Plug>NERDCommenterToggle
vmap <C-/>   <Plug>NERDCommenterToggle<CR>gv
nnoremap <C-n> :NERDTreeToggle<CR>

" Tabs----------------------------------------

nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> 9gt

" Remove Registers --------------------------

set viminfo='100,<0,s10,h

" Auto Reload ------------------------------

" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" notification after file change
autocmd FileChangedShellPost *
\ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

