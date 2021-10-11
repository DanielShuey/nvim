let path = expand('%:p:h') . '\..\..\..\..\..\AppData\Local\nvim\'

exe 'source' path . '\.nvimrc'

set guifont=Consolas:h11