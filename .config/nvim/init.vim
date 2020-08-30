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
set linebreak
set nostartofline
set laststatus=2
set noshowmode
set listchars=eol:¬

let &packpath = &runtimepath

""" ~~~ Plugins with plug.vim ~~~ 
call plug#begin('~/.config/nvim/plugins.d')

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'itchyny/vim-gitbranch'
Plug 'ap/vim-css-color'
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-fugitive'

call plug#end()

""" ~~~ Gruvbox Settings ~~~
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark
highlight normal ctermbg=none

""" ~~~ Airline things ~~~
" ~~~ Make symbols work
let g:airline_symbols = {}
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.dirty='⚡'
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
" ~~~ Plugin loading
let g:airline_extensions = []
let g:airline_extensions = ['branch', 'wordcount']

""" ~~~ Hotkeys ~~~ <F5> and <F6> are reserved for compilation
inoremap <F1> <esc>/<++><CR>"_c4l
vnoremap <F1> <esc>/<++><CR>"_c4l
map <F1> <esc>/<++><CR>"_c4l
map <F2> :setlocal spell! spelllang=en_us<CR>
map <F3> zz
map <F4> <esc>:w<CR>
inoremap <F4> <esc>:w<CR>a
map <F7> <esc>:setlocal cursorcolumn!<CR>
map <F8> <esc>:setlocal list!<CR>

""" ~~~ Bracket autocompletion for certain filetypes ~~~
autocmd Filetype c,go,python,cpp,tex inoremap [ []<++><esc>T[i
autocmd Filetype c,go,python,cpp,tex inoremap ( ()<++><esc>T(i
autocmd Filetype c,go,python,cpp,tex inoremap " ""<esc>T"i
autocmd Filetype c,go,python,cpp,tex inoremap ' ''<esc>T'i
autocmd Filetype c,go,python,cpp,tex inoremap { {}<++><esc>T{i
autocmd Filetype c,go,python,cpp,tex inoremap `{ {<esc>o}<esc>ko

""" ~~~ C programming ~~~
" ~~~ Compilation
autocmd Filetype c map <F5> <esc>:w<CR>:! clear && gcc % && ./a.out<CR>
autocmd Filetype c inoremap <F5> <esc>:w<CR>:! clear && gcc % && ./a.out<CR>

""" ~~~ Golang programming ~~~
" ~~~ Compilation
autocmd Filetype go map <F5> <esc>:w<CR>:! go build % && ./$(echo % \| sed 's/.go//')<CR>
autocmd Filetype go inoremap <F5> <esc>:w<CR>:! go build % && ./$(echo % \| sed 's/.go//')<CR>

""" ~~~ Python things ~~~
" ~~~ Compilation
autocmd Filetype python map <F5> <esc>:w<CR>:! python %<CR>
autocmd Filetype python inoremap <F5> <esc>:w<CR>:! python %<CR>

""" ~~~ LaTeX stuffs ~~~
" ~~~ Compilation
autocmd Filetype tex map <F5> <esc>:w<CR>:! pdflatex %<CR><CR>:! zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
autocmd Filetype tex map <F6> <esc>:w<CR>:! pdflatex %<CR><CR>
autocmd Filetype tex inoremap <F5> <esc>:w<CR>:! pdflatex %<CR><CR>:! zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>a
autocmd Filetype tex inoremap <F6> <esc>:w<CR>:! pdflatex %<CR><CR>
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
autocmd Filetype tex inoremap `s \section{}<space><++><esc>T{i
autocmd Filetype tex inoremap `u \subsection{}<space><++><esc>T{i
autocmd Filetype tex inoremap `b \subsubsection{}<space><++><esc>T{i
autocmd Filetype tex inoremap `p \item<space>
