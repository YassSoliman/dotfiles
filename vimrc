set nocompatible
if !exists("g:syntax_on")
    syntax enable
endif
filetype plugin indent on
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set showcmd		       " Show the current command
set tabstop=4		       " show existing tab with 4 spaces width
set shiftwidth=4	       " when indenting with '>' use 4 spaces width
set expandtab		       " on pressing tab insert 4 spaces
"Autoinstall vim-plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Setting up plugins
call plug#begin('~/.vim/bundle')
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/pangloss/vim-javascript.git'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'https://tpope.io/vim/surround.git'
Plug 'https://github.com/ErichDonGubler/vim-sublime-monokai.git'
Plug 'https://github.com/stephpy/vim-php-cs-fixer.git'
Plug 'https://github.com/StanAngeloff/php.vim.git'
call plug#end()

" Colorscheme setup
colo sublimemonokai

" Setting up airline preferences
let g:airline#extensions#tabline#enabled = 1		" Show the different buffers tab-like
let g:airline#extensions#tabline#buffer_nr_show = 1 	" Show buffer numbers
" Easy moving between buffers
map <C-right> :bn<cr>
map <C-left> :bp<cr>
map <C-d> :bd<cr> 
" Keep buffer history when exiting vim
set viminfo^=%

" Braces autocomplete remaps
inoremap (; (<CR>);<C-c>O
inoremap ({; ({<CR>});<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O

" Ultisnips config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Setting up syntax for personal use
au BufNewFile,BufRead *.ejs set filetype=html
