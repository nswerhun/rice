"""   ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"""   ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"""   ██║   ██║██║██╔████╔██║██████╔╝██║     
"""   ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
""" ██╗╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
""" ╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
                                         
syntax on

set number
set relativenumber
set incsearch
set expandtab
set tabstop=4
set shiftwidth=4
set scrolloff=5
set mouse=
set linebreak
set nostartofline
set laststatus=2
set noshowmode

hi normal ctermbg=none

""" ~~~ Plugins with plug.vim ~~~ 
call plug#begin('~/.vim/pluginsd')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'itchyny/vim-gitbranch'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

call plug#end()

""" ~~~ Lightline configuration ~~~
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \    'left': [ [ 'mode', 'paste' ], 
    \              [ 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'lineinfo' ],
    \              [ 'percent' ],
    \              [ 'gitbranch', 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'gitbranch#name'
    \ },
    \ }

autocmd vimenter * colorscheme gruvbox

""" ~~~ Settings regarding placeholders ~~~
inoremap <F1> <esc>/<++><enter>"_c4l
vnoremap <F1> <esc>/<++><enter>"_c4l
map <F1> <esc>/<++><enter>"_c4l

""" ~~~ General Hotkeys ~~~
map <F2> :setlocal spell! spelllang=en_us<CR>
map <F3> zz
map <F4> <esc>:w<CR>
map <F7> <esc>:setlocal<space>cursorcolumn!<CR>
inoremap <F4> <esc>:w<CR>a
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<CR><CR>

""" ~~~ C programming ~~~
" ~~~ Compilation
autocmd Filetype c inoremap <F9> <esc>:w<CR>:! clear && gcc % && ./a.out<CR>
autocmd Filetype c map <F9> <esc>:w<CR>:! clear && gcc % && ./a.out<CR>
" ~~~ Bracket auto complete
autocmd Filetype c inoremap [ []<space><++><esc>T[i
autocmd Filetype c inoremap ( ()<space><++><esc>T(i
autocmd Filetype c inoremap " ""<space><++><esc>T"hi
autocmd Filetype c inoremap ' ''<space><++><esc>T'hi
autocmd Filetype c inoremap { {}<space><++><esc>T{i
autocmd Filetype c inoremap `{ {<esc>o}<esc>ko

""" ~~~ LaTeX stuffs ~~~
" ~~~ Compilation
autocmd Filetype tex map <F5> :! pdflatex %<CR><CR>
autocmd Filetype tex map <F6> :! zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
autocmd Filetype tex inoremap <F9> <esc>:w<CR>:! pdflatex %<CR><CR>a
autocmd Filetype tex map <F9> <esc>:w<CR>:! pdflatex %<CR><CR>
" ~~~ Text formatting
autocmd Filetype tex nnoremap ;b i\textbf{<esc>ea}<esc>
autocmd Filetype tex inoremap ;b \textbf{}<space><++><esc>T{i
autocmd Filetype tex nnoremap ;i i\textit{<esc>ea}<esc>
autocmd Filetype tex inoremap ;i \textit{}<space><++><esc>T{i
autocmd Filetype tex nnoremap ;e i\emph{<esc>ea}<esc>
autocmd Filetype tex inoremap ;e \emph{}<space><++><esc>T{i
autocmd Filetype tex nnoremap ;s i\textsc{<esc>ea}<esc>
autocmd Filetype tex inoremap ;s \textsc{}<space><++><esc>T{i
autocmd Filetype tex nnoremap ;q i``<esc>ea''<esc>
autocmd Filetype tex inoremap ;q ``''<space><++><esc>T`i
" ~~~ Document syntax
autocmd Filetype tex inoremap `d \begin{document}<esc>o\end{document}<esc>ko
autocmd Filetype tex inoremap `e \begin{enumerate}<esc>o\end{enumerate}<esc>ko
autocmd Filetype tex inoremap `i \begin{itemize}<esc>o\end{itemize}<esc>ko
autocmd Filetype tex inoremap `c \begin{center}<esc>o\end{center}<esc>ko
autocmd Filetype tex inoremap `s \section<enter>
autocmd Filetype tex inoremap `u \subsection<enter>
autocmd Filetype tex inoremap `b \subsubsection<enter>
autocmd Filetype tex inoremap `p \item<space>
