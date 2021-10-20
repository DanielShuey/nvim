" autocmd BufWrite * :<C-u>OmniSharpCodeFormat<cr>

if has("unix")
	let g:OmniSharp_translate_cygwin_wsl = 1
else
	let g:OmniSharp_translate_cygwin_wsl = 0
endif

let g:OmniSharp_loglevel = 'debug'
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_findusages = 'fzf'
let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_highlighting = 3

nnoremap . <NOP> 
vnoremap <C-.> :call OmniSharp#actions#codeactions#Get('visual')<cr>
nnoremap <C-.> :call OmniSharp#actions#codeactions#Get('normal')<cr>

let g:OmniSharp_popup = 0

if has('patch-8.1.1880')
  set completeopt=longest,menuone,popuphidden
  "" Highlight the completion documentation popup background/foreground the same as
  "" the completion menu itself, for better readability with highlighted
  "" documentation.
  set completepopup=highlight:Pmenu,border:off
else
  set completeopt=longest,menuone,preview
  "" Set desired preview window height for viewing documentation.
  set previewheight=9
endif

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
"let g:ale_linters = { 'cs': ['OmniSharp'] }

augroup omnisharp_commands
  autocmd!

  "" Show type information automatically when the cursor stops moving.
  "" Note that the type is echoed to the Vim command line, and will overwrite
  "" any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  "" Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
augroup END
