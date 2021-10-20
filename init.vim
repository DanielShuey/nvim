if has("unix")
	let path = '~/.config/nvim/'
else
	let path = '~\AppData\Local\nvim\'
endif

exe 'source' path . '.nvimrc'

set guifont=SauceCodePro NF:h11:l