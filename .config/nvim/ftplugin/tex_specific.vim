"""""""""""""""""""""""""""""""""""
"""			       """
"""     Vvamp's FTDetect       """
"""			       """
"""""""""""""""""""""""""""""""""""


function! s:PrintHomeworkAssignment() 
    let line=getline('.')
    execute append('.',"\begin{mdframed}[backgroundcolor=hublue]")
    execute append('.',"\end{mdframed}")
    execute append('.',"\begin{align*}")
    execute append('.',"\end{align*}")
    execute append('.',"\assignmentspace")
    execute "echo \'Pasted!\'"
endfunction
nmap <F2> :call <SID>PrintHomeworkAssignment()<CR>
