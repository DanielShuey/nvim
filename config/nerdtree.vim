
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

let g:NERDTreeDirArrowExpandable = '⯈'
let g:NERDTreeDirArrowCollapsible = '⯆'
let NERDTreeShowHidden=1