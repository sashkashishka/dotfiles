function! myspacevim#after() abort
  let g:user_emmet_leader_key=','
  autocmd FileType javascriptreact,typescriptreact EmmetInstall
  " au BufNewFile,BufRead *.tsx,*.jsx,*.js set filetype=typescript

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  function! OpenZippedFile(f)
    " get number of new (empty) buffer
    let l:b = bufnr('%')
    " construct full path
    let l:f = substitute(a:f, '\/zip\:\(.*\).zip/', 'zipfile:\1.zip::', '')
    let l:f1 = substitute(l:f, '\.yarn\/\(.*\)\/cache', '.yarn/cache', '')

    " swap back to original buffer
    b #
    " delete new one
    exe 'bd! ' . l:b
    " open buffer with correct path
    sil exe 'e ' . l:f1
    " read in zip data
    call zip#Read(l:f1, 1)
  endfunction

  au BufReadCmd /zip:*.yarn/*.zip/* call OpenZippedFile(expand('<afile>'))
endfunction


