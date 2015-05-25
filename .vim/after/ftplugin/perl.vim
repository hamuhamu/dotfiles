setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

" -nargs=1 受け取る引数は1
command! -nargs=1 DocMod  :Ref perldoc -m<Space><args>
command! -nargs=1 DocFunc :Ref perldoc -f<Space><args>
