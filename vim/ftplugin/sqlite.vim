
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EXECUTE -- OTHER WINDOW
nmap <buffer> <F2> :call SQLITE_ScratchQuery("", "")<CR>
nmap <buffer> <F3> :call SQLITE_ScratchQuery("-column", "")<CR>
nmap <buffer> <F4> :call SQLITE_ScratchQuery("-line", "")<CR>

" EXPLAIN
nmap <buffer> ,e :call SQLITE_ScratchQuery("-column", "explain")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SQLITE_ScratchQuery(type, prefix)
  normal yip
  let l:query=Strip(@0)

  if !exists("g:db_config")
    call SQLITE_Database_Vars()
  end

  if a:type == '-column'
    Scratch "sqlite3 -header -nullvalue null " . g:db_config["filename"] . " '" . l:query . "' | column -t -s \\|"
  else
    Scratch "sqlite3 -header -nullvalue null " . a:type . " " . g:db_config["filename"] . " '" . l:query . "'"
  end
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! SQLITE_Database_Vars()
  if !exists("g:db_config")
    let g:db_config = {"filename": $DB_FILENAME}
  end

  let g:db_config["filename"] = input("database: ", g:db_config["filename"], "file")
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

