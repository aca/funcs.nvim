" Chomp | remove trailing whitespaces
command! Chomp call funcs#chomp()

" YankPath | copy current path in form of filename:linenr
command! YankPath lua require'funcs'.yankpath()

" Highlight | find highlight in current context
command! Highlight call funcs#highlight()

" EX | chmod +x current buffer
command! EX call funcs#ex()

" :Root | Change directory to the root of the Git repository
command! Root call funcs#root()

" CD | cd to current buffer located
command! CD call funcs#cd()

" " R | Shell command in new preview tab | :R echo hello
" command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>

command! Remove call funcs#remove()


" abbrev
cnoreabbrev root Root
cnoreabbrev yankpath YankPath
cnoreabbrev chomp Chomp
