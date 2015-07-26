setlocal shiftwidth=4
setlocal tabstop=4
setlocal softtabstop=4

command! PHPUnitTestCase :r $HOME/.vim/template/php/PhpUnitTestCase.php
command! PHPUnitDp       :r $HOME/.vim/template/php/PhpUnitTestDataProvider.php

" 現在、開いているPHPファイルをphpunitで実行
nnoremap <expr> <C-t> ':!phpunit ' . expand('%:p') . '<CR>'
