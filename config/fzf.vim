set rtp+=~/.fzf

command! -bang -nargs=? -complete=dir CS call fzf#vim#files(<q-args>, {'source' : 'fd . ./Assets/Source -e cs --type f', 'options': ['--layout=reverse', '--info=inline']}, <bang>0)

nnoremap <C-p> :CS<cr>

autocmd VimEnter * GuiPopupmenu 0