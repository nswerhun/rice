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
set listchars=eol:¬,space:␣,trail:‗
set formatoptions-=cro
set ignorecase smartcase
set splitright

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

""" ~~~ Theme Settings ~~~
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

""" ~~~ Hotkeys ~~~ <F5> is reserved for LaTeX compilation
map  <F1> <esc>/<++><CR>"_c4l
imap <F1> <esc>/<++><CR>"_c4l
map  <F2> :setlocal spell! spelllang=en_us<CR>
map  <F3> zz
map  <F4> <esc>:w<CR>
imap <F4> <esc>:w<CR>a
map  <F7> <esc>:setlocal cursorcolumn!<CR>:setlocal cursorline!<CR>
map  <F8> <esc>:setlocal list!<CR>
map  <F9> <esc>:nohl<CR>
imap <F9> <esc>:nohl<CR>a

""" ~~~ Split navigation ~~~
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

""" ~~~ Convenient autocommands
" ~~~ Set cursorline for insert mode
autocmd InsertEnter,InsertLeave * setlocal cursorline!
" ~~~ Autocompile certain files
autocmd BufWritePost $HOME/.config/dwm/config.h :!sudo make -C ~/.config/dwm clean install
autocmd BufWritePost $HOME/.config/dmenu/config.h :!sudo make -C ~/.config/dmenu clean install
autocmd BufWritePost $HOME/.config/st/config.h :!sudo make -C ~/.config/st clean install
autocmd BufWritePost $HOME/.config/dwmblocks/blocks.h :!sudo make -C ~/.config/dwmblocks clean install && killall dwmblocks && dwmblocks & disown
" ~~~ Set filetypes for certain files
autocmd VimEnter $ZDOTDIR/.zaliases :setf zsh
autocmd VimEnter $HOME/.config/mutt/personal :setf muttrc
autocmd VimEnter $HOME/.config/mutt/school :setf muttrc


""" ~~~ Bracket autocompletion for certain filetypes ~~~
autocmd Filetype c,cpp,python inoremap [     []<++><esc>T[i
autocmd Filetype c,cpp,python inoremap (     ()<++><esc>T(i
autocmd Filetype c,cpp,python inoremap "     ""<esc>T"i
autocmd Filetype c,cpp,python inoremap '     ''<esc>T'i
autocmd Filetype c,cpp,python inoremap {     {}<++><esc>T{i
autocmd Filetype c,cpp,python inoremap {<CR> {<esc>o}<esc>ko

""" ~~~ LaTeX stuffs ~~~
" ~~~ Compilation
autocmd BufWritePost *.tex :silent !pdflatex % && texclean %
autocmd Filetype tex map      <F5> <esc>:w<CR>:!pdflatex %<CR><CR>:!zathura $(sed 's/tex$/pdf/' <<< %) & disown<CR><CR>
" ~~~ Syntax macros
autocmd Filetype tex inoremap ;b \textbf{}<++><esc>T{i
autocmd Filetype tex inoremap ;i \textit{}<++><esc>T{i
autocmd Filetype tex inoremap ;e \emph{}<++><esc>T{i
autocmd Filetype tex inoremap ;s \textsc{}<++><esc>T{i
autocmd Filetype tex inoremap ;f \textsf{}<++><esc>T{i
autocmd Filetype tex inoremap ;t \texttt{}<++><esc>T{i
autocmd Filetype tex inoremap ;q ``''<++><esc>T`i
autocmd Filetype tex imap     `b \begin{}<CR><++><CR>\end{}<esc>\\\2<up>2<right>\\\i
autocmd Filetype tex inoremap `s \section{}<CR><++><esc>k0f{a
autocmd Filetype tex inoremap `u \subsection{}<CR><++><esc>k0f{a
autocmd Filetype tex inoremap `e \subsubsection{}<CR><++><esc>k0f{a
autocmd Filetype tex inoremap `p \usepackage{}<CR><++><esc>k0f{a
autocmd Filetype tex inoremap `i \item<space>
autocmd Filetype tex inoremap `; \begin{equation}<CR>\end{equation}<esc>ko
