"
" Minor tweaks that make Vim more seamless
"

" Move up a line even through word wrap
nnoremap j gj
nnoremap k gk

" Ignores the casing when searching
set smartcase

" Always show hidden files with NerdTree
let NERDTreeShowHidden=1

" Incrementally highlights the results of a search
set incsearch

" Fuzzy File finding settings
let g:ctrlp_map = '<LEADER>p'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'git ls'

" Find current file in NerdTree
nnoremap <LEADER>f :NERDTreeFind<CR>

" Autoreload AutoHotkey files on save
augroup ahkfiles
    autocmd!
    autocmd BufWritePost *.ahk call ReloadScript()
augroup END

function ReloadScript()
    let l:ahk = 'timeout 1s "/mnt/c/Program Files/AutoHotkey/AutoHotkey.exe" /r'
    let l:filepath = expand("%:p")
    let l:replacedrive = substitute(filepath, "/mnt/c/", "C:\\", "g")
    let l:windowspath = "\"" . substitute(replacedrive, "/", "\\", "g") . "\""

    silent execute "!" . l:ahk . " " . l:windowspath
    redraw!
endfunction
