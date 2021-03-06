" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    215


if !exists('g:worksheet#rcom#reuse')
    " If non-null, reuse an already running instance or R GUI.
    "   0 ... Don't reuse a running instance of R
    "   1 ... Reuse a running R instance
    let g:worksheet#rcom#reuse = 0   "{{{2
endif


let s:prototype = {'syntax': 'r'}


function! s:prototype.Evaluate(lines) dict "{{{3
    return rcom#Evaluate(join(a:lines, "\n"), 'r')
endf


function! s:prototype.Keyword() dict "{{{3
    call rcom#Keyword()
endf


function! s:prototype.Quit() dict "{{{3
    " " Gets called by #RCom#BufUnload
    " call rcom#Quit()
endf


function! worksheet#rcom#InitializeInterpreter(worksheet) "{{{3
    call rcom#Initialize(g:worksheet#rcom#reuse)
endf


function! worksheet#rcom#InitializeBuffer(worksheet) "{{{3
    call extend(a:worksheet, s:prototype)
    runtime indent/r.vim
    runtime ftplugin/r.vim
    setlocal omnifunc=rcom#Complete
    " noremap <silent> <buffer> K :call b:worksheet.Evaluate(['help("'. expand('<cword>') .'")'])<cr>
    setlocal iskeyword+=.
endf


