"""   ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"""   ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"""   ██║   ██║██║██╔████╔██║██████╔╝██║
"""   ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
""" ██╗╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
""" ╚═╝ ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝

syntax on

set number relativenumber
set incsearch
set expandtab
set tabstop=4
set shiftwidth=4
set scrolloff=5
set linebreak
set nostartofline
set laststatus=2
set noshowmode
set listchars=eol:¬,space:␣
set formatoptions-=cro
set ignorecase
set smartcase

let &packpath = &runtimepath

""" ~~~ Plugins with plug.vim ~~~ 
call plug#begin('~/.config/nvim/plugins.d')

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
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

""" ~~~ Set multi-cursor for instant escape ~~~
let g:VM_quit_after_leaving_insert_mode = 1

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
let g:airline_symbols.maxlinenr = ' '
" ~~~ Plugin loading
let g:airline_extensions = []
let g:airline_extensions = ['branch', 'wordcount']

""" ~~~ Hotkeys ~~~ <F5> and <F6> are reserved for compilation
map <F1> <esc>/<++><CR>"_c4l
imap <F1> <esc>/<++><CR>"_c4l
map <F2> :setlocal spell! spelllang=en_us<CR>
map <F3> zz
map <F4> <esc>:w<CR>
map <F7> <esc>:setlocal cursorcolumn!<CR>:setlocal cursorline!<CR>
map <F8> <esc>:setlocal list!<CR>
map <F9> <esc>:nohl<CR>
imap <F9> <esc>:nohl<CR>a

""" ~~~ Bracket autocompletion for certain filetypes ~~~
autocmd Filetype c,cpp,tex,python inoremap [     []<++><esc>T[i
autocmd Filetype c,cpp,tex,python inoremap (     ()<++><esc>T(i
autocmd Filetype c,cpp,tex,python inoremap "     ""<esc>T"i
autocmd Filetype c,cpp,tex,python inoremap '     ''<esc>T'i
autocmd Filetype c,cpp,python     inoremap {     {}<++><esc>T{i
autocmd Filetype c,cpp,tex,python inoremap {<CR> {<esc>o}<esc>ko

""" ~~~ LaTeX stuffs ~~~
" ~~~ Compilation
autocmd Filetype tex map      <F5> <esc>:w<CR>:! pdflatex %<CR><CR>:! zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
autocmd Filetype tex map      <F6> <esc>:w<CR>:! pdflatex %<CR><CR>
autocmd Filetype tex map!     <F5> <esc>:w<CR>:! pdflatex %<CR><CR>:! zathura $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>a
autocmd Filetype tex map!     <F6> <esc>:w<CR>:! pdflatex %<CR><CR>a
" ~~~ Text formatting
autocmd Filetype tex nnoremap ;i i\textbf{<esc>ea}<esc>
autocmd Filetype tex inoremap ;b \textbf{}<++><esc>T{i
autocmd Filetype tex nnoremap ;i i\textit{<esc>ea}<esc>
autocmd Filetype tex inoremap ;i \textit{}<++><esc>T{i
autocmd Filetype tex nnoremap ;e i\emph{<esc>ea}<esc>
autocmd Filetype tex inoremap ;e \emph{}<++><esc>T{i
autocmd Filetype tex nnoremap ;s i\textsc{<esc>ea}<esc>
autocmd Filetype tex inoremap ;s \textsc{}<++><esc>T{i
autocmd Filetype tex nnoremap ;q i``<esc>ea''<esc>
autocmd Filetype tex inoremap ;q ``''<++><esc>T`i
" ~~~ Document syntax
autocmd Filetype tex imap     `e \begin{}<CR><++><CR>\end{}<esc>\\\2<up>2<right>\\\i
autocmd Filetype tex inoremap `s \section{}<CR><++><esc>k0f{a
autocmd Filetype tex inoremap `u \subsection{}<CR><++><esc>k0f{a
autocmd Filetype tex inoremap `b \subsubsection{}<CR><++><esc>k0f{a
autocmd Filetype tex inoremap `p \item<space>
