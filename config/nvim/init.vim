call plug#begin('~/.config/nvim/plugged')
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"nerf neomake, using ale
"Plug 'neomake/neomake'
Plug 'scrooloose/nerdTree'
Plug 'junegunn/fzf'
Plug 'w0rp/ale'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'othree/eregex.vim'
Plug 'tpope/vim-fugitive'

"color schemes
Plug 'tomasr/molokai'
Plug 'nightsense/seagrey'
Plug 'nightsense/carbonized'
Plug 'beigebrucewayne/Turtles'
Plug 'Zabanaa/neuromancer.vim'
Plug 'hzchirs/vim-material'
Plug 'iKarith/tigrana'
call plug#end()

set tabstop=2
set shiftwidth=2
set expandtab

nnoremap ; :

nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>

cnoremap        <C-A> <Home>
cnoremap        <C-B> <Left>
cnoremap <expr> <C-D> getcmdpos()>strlen(getcmdline())?"\<Lt>C-D>":"\<Lt>Del>"
cnoremap <expr> <C-F> getcmdpos()>strlen(getcmdline())?&cedit:"\<Lt>Right>"

" kill and yank
cnoremap <C-k> <C-\>esetreg('k', strpart(getcmdline(), getcmdpos() - 1)) ? getcmdlind() : strpart(getcmdline(),0,getcmdpos()-1)<CR>
cnoremap <C-y> <C-\>estrpart(getcmdline(),0,getcmdpos()-1) . @k . strpart(getcmdline(), getcmdpos() - 1)<CR>


let FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || find . -path "*/\.*" -prune -o -type f -print -o -type l -print | sed s/^..//) 2> /dev/null'

noremap <C-]> :FZF<CR>

set t_Co=256
syntax enable
set background=dark
"colorscheme tigrana-256-dark
colorscheme turtles

let g:rehash256 = 1

" Ale Settings
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '>>'

" Neomake Settings
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_jsx_eslint_maker = {
      \ 'exe': '/Users/jcharry/repos/squarespace-v6/site-server/node_modules/.bin/eslint',
\ 'args': ['--no-color', '--format', 'compact'],
\ 'errorformat': '%f: line %l\, col %c\, %m'
\ }
let g:neomake_javascript_eslint_maker = {
\ 'args': ['--no-color', '--format', 'compact'],
\ 'errorformat': '%f: line %l\, col %c\, %m'
\ }

