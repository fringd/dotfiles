call plug#begin('~/.config/nvim/plugged')
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Shougo/deoplete.nvim',  { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'vim-syntastic/syntastic'

"nerf neomake, using ale
Plug 'scrooloose/nerdTree'
Plug 'junegunn/fzf'
Plug 'w0rp/ale'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'othree/eregex.vim'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'

"color schemes
Plug 'tomasr/molokai'
Plug 'nightsense/seagrey'
Plug 'nightsense/carbonized'
Plug 'beigebrucewayne/Turtles'
Plug 'Zabanaa/neuromancer.vim'
Plug 'hzchirs/vim-material'
Plug 'iKarith/tigrana'

"typescript
Plug 'mhartington/nvim-typescript'
"Plug 'Quramy/tsuquyomi'
"Plug 'leafgarland/typescript-vim'
"Plug 'Shougo/vimproc.vim'

"ejs
Plug 'briancollins/vim-jst'



"coffeescript
Plug 'kchmck/vim-coffee-script'
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

" python
let g:python3_host_prog = '/Users/rdobson/.pyenv/shims/python3'

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
\   'typescript': ['eslint'],
\}
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '>>'

" syntastic

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = 'npm run lint --'

"typescript
"let g:typescript_compiler_binary = 'tsc'
"let g:typescript_compiler_options = ''
"autocmd FileType typescript :set makeprg=tsc
"autocmd FileType typescript nmap <buffer> <Leader>T : <C-u>echo tsuquyomi#hint()<CR>
"set omnifunc=syntaxcomplete#Complete
"autocmd FileType typescript set omnifunc=tsuquyomi#complete
"

"typescript2
let g:deoplete#enable_at_startup = 1
augroup FiletypeGroup
  autocmd!
  " .ts is a Typescript file
  au BufNewFile,BufRead *.ts set filetype=typescript
augroup END


" supertab (completefunc) + latex-box (omnifunc)
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-p>"
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&omnifunc:<c-x><c-o>"]
" Problem with load order (vimrc is evaluated before latex-box setting of omnifunc)
" \ verbose set omnifunc? | " is empty
" added this autocommand to after/ftplugin/tex.vim
" :do FileType solves also the problem
autocmd FileType * 
      \ if &omnifunc != '' |
      \ call SuperTabChain(&omnifunc, "<c-p>") |
      \ call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
      \ endif

