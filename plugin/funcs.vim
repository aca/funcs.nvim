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
command! -nargs=1 -complete=dir Rename :lua require'funcs.nvim'.rename(<f-args>)

" :Mkdir ARG | mkdir -p
command! -nargs=1 Mkdir :call mkdir(<f-args>, 'p')

" :NextFile | open next file in 'ls | sort'
command! NextFile :lua require'funcs.nvim'.open_nextfile()

" :PrevFile | open previous file in 'ls | sort'
command! PrevFile :lua require'funcs.nvim'.open_prevfile()

command! DelMarksAll :delm! | delm A-Z0-9

command! DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis

command! PlugHelp call fzf#run(fzf#wrap({ 'source': sort(keys(g:plugs)), 'sink': function('funcs#plug_help_sink')}))

" Sort by selected(visual) column, by Gavin Freeborn
command! -range -nargs=0 -bang SortVis sil! keepj <line1>,<line2>call funcs#VisSort(<bang>0)
