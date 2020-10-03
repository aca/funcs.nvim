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

function funcs#remove()
  lua require'funcs'.remove_file()
  bd!
endfunction

