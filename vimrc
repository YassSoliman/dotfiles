if !exists("g:syntax_on")
    syntax enable
endif
filetype plugin indent on
set nocompatible
set number                     " Show current line number
set relativenumber             " Show relative line numbers
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/bundle')
Plug 'https://github.com/ErichDonGubler/vim-sublime-monokai.git'
Plug 'https://tpope.io/vim/surround.git'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'https://github.com/tpope/vim-vinegar.git'
Plug 'https://github.com/pangloss/vim-javascript.git'
call plug#end()
colo sublimemonokai
" Add javascript curley braces autocomplete
inoremap (; (<CR>);<C-c>O
inoremap ({; ({<CR>});<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O
let g:airline#extensions#tabline#enabled = 1
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>  
" :exec 'set viminfo=%,' . &viminfo
set hidden
" Show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
let c = 1
while c <= 99
  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
  let c += 1
endwhile
" Start autocompletion after 4 chars
 let g:ycm_min_num_of_chars_for_completion = 4
 let g:ycm_min_num_identifier_candidate_chars = 4
 let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
" Configuring netrw to not have to download useless plugins
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:ycm_key_list_select_completion = ['<Down>']
au BufNewFile,BufRead *.ejs set filetype=html
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" Incorrect use of tabs, keeping it in case I start using tabs properly
" if exists("+showtabline")
"      function MyTabLine()
"          let s = ''
"          let t = tabpagenr()
"          let i = 1
"          while i <= tabpagenr('$')
"              let buflist = tabpagebuflist(i)
"              let winnr = tabpagewinnr(i)
"              let s .= '%' . i . 'T'
"              let s .= (i == t ? '%1*' : '%2*')
"              let s .= ' '
"              let s .= i . ')'
"              let s .= ' %*'
"              let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
"              let file = bufname(buflist[winnr - 1])
"              let file = fnamemodify(file, ':p:t')
"              if file == ''
"                  let file = '[No Name]'
"              endif
"              let s .= file
"              let i = i + 1
"          endwhile
"          let s .= '%T%#TabLineFill#%='
"          let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
"          return s
"      endfunction
"      set stal=2
"      set tabline=%!MyTabLine()
" endif
