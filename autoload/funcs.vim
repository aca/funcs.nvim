function funcs#root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd' root
    echo 'Changed directory to: '.root
  endif
endfunction
command! Root call s:root()

function funcs#highlight()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction

function funcs#chomp()
  silent! %s/\s\+$// | normal! ``
endfunction

" EX | chmod +x current buffer
function funcs#ex()
  if !empty(expand('%'))
    write
    call system('chmod +x '.expand('%'))
    silent e
  else
    echohl WarningMsg
    echo 'Save the file first'
    echohl None
  endif
endfunction

function funcs#cd()
  execute ":lcd ". expand("%:p:h")
  echon 'pwd: ' . expand("%:p:h")
endfunction

function funcs#plug_help_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'tabedit' match
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction

function! funcs#VisSort(isnmbr) range abort
	if visualmode() !=# "\<c-v>"
		execute 'silent! '.a:firstline.','.a:lastline.'sort i'
		return
	endif
	let firstline = line("'<")
	let lastline  = line("'>")
	let keeprega  = @a
	execute 'silent normal! gv"ay'
	execute "'<,'>s/^/@@@/"
	execute "silent! keepjumps normal! '<0\"aP"
	if a:isnmbr
		execute "silent! '<,'>s/^\s\+/\=substitute(submatch(0),' ','0','g')/"
	endif
	execute "sil! keepj '<,'>sort i"
	execute 'sil! keepj '.firstline.','.lastline.'s/^.\{-}@@@//'
	let @a = keeprega
endfunction
