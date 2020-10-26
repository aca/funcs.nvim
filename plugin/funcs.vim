" :Chomp | remove trailing whitespaces
command! Chomp call funcs#chomp()

" :YankPath | copy current path in form of filename:linenr
command! YankPath :lua require'funcs.nvim'.yankpath()

" :Highlight | find highlight in current context
command! Highlight call funcs#highlight()

" :EX | chmod +x current buffer
command! EX call funcs#ex()

" :Root | Change directory to the root of the Git repository
command! Root call funcs#root()

" :CD | cd to current buffer located
command! CD call funcs#cd()

" :Remove | remove(from filesystem), close current buffer 
command! Remove :lua require'funcs.nvim'.remove_file()

" :Rename ARG | rename
command! -nargs=1 Rename :lua require'funcs.nvim'.rename(<f-args>)

" :Mkdir ARG | mkdir -p
command! -nargs=1 Mkdir :call mkdir(<f-args>, 'p')
