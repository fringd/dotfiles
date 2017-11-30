call plug#begin('~/.config/nvim/plugged')
Plug 'pangloss/vim-javascript'
"nerf neomake, using ale
"Plug 'neomake/neomake'
Plug 'scrooloose/nerdTree'
Plug 'junegunn/fzf'
Plug 'w0rp/ale'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'othree/eregex.vim'

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

noremap ; :

noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

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

