colorscheme evening
au BufNewFile,BufRead *vimrc* setf vim " IF filename matches 'vimrc' treat it as FileType vim  (for autocommands)

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nu


set ts=4        " Tabsize 4 whitespaces
set shiftwidth=4        " shifting with < or > use 4 whitespaces
set incsearch
set autochdir   " change dir when switching between tabs
set wildmenu    " show possible hits, like autocompletion in menus
set smartindent " auto indent when coding with script blocks
set number      " show line numbers
set cmdheight=2
set modeline
set laststatus=2
set statusline=%F       " show full filepath in statusline
set statusline=+=\ %y   " show recognized filetype
set ignorecase
set smartcase

highlight CursorLine cterm=NONE ctermbg=darkred ctermfg=white
highlight CursorColumn cterm=NONE ctermbg=blue ctermfg=white
highlight TabLine cterm=NONE ctermbg=blue ctermfg=white
highlight TabLineFill cterm=NONE ctermbg=blue

nnoremap . :
nnoremap ww<CR> <Esc>:w<CR>
nnoremap xx<CR> <Esc>:x<CR>

autocmd FileType python,php,css,sh noremap <buffer> ; :s/^#//<CR>
autocmd FileType python,php,css,sh noremap <buffer> , :s/^/#/<CR>
autocmd FileType python nnoremap <buffer> <F9> :!python %<CR>
autocmd FileType python nnoremap <buffer>  :!python -i %<CR>
autocmd FileType python setlocal smartindent cinwords=if,elif,else,for,while,dry,except,finally,def,class
autocmd FileType c nnoremap <buffer> , :s/^/\/\//<CR>
autocmd FileType c nnoremap <buffer> ; :s/^\/\///<CR>
autocmd FileType c nnoremap <buffer> <F9> :make<CR>
autocmd FileType c nnoremap <buffer> <S-F9> :make<CR> :!./%<<CR>
autocmd FileType c nnoremap <buffer> <C-F9> :make<CR> :!./%< 
autocmd FileType vim nnoremap <buffer> <F9> :source %<CR>
autocmd FileType vim nnoremap <buffer> , :s/^/"/<CR>
autocmd FileType vim nnoremap <buffer> ; :s/^"//<CR>
autocmd FileType sh nnoremap <buffer> <F9> :!bash %<CR>
autocmd FileType php nnoremap <buffer> <F9> :!php %<CR>
autocmd BufWinLeave *.c,*.py,*.php,*.sh mkview
autocmd BufWinEnter *.c,*.py,*.php,*.sh silent loadview
