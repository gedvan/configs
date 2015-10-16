" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

" Bundle management
" ------------------------------------------------------------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles
NeoBundle 'Shougo/unite.vim'
NeoBundle 'vim-scripts/closetag.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Valloric/YouCompleteMe'


call neobundle#end()
filetype plugin indent on
NeoBundleCheck


" Basic settings
" ------------------------------------------------------------------------------

" Visual
set nonumber        " don't show line numbers
set ruler           " show the ruler
set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
set showcmd
set showmatch       " show matching brackets/parenthesis
set showmode        " display the current mode
set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P
set title                       " shos file name on footer
set ttyfast                     " Better window redraw
set wildmenu
set wildmode=list:longest,full  " comand <tab> completion, list matches and
                                " complete the longest common part, then,
                                " cycle through the matches

" Indent
set cindent
set autoindent      " indent at the same level of the previous line
set tabstop=4       " use indents of 4 spaces
set shiftwidth=4
set softtabstop=4
set noexpandtab     " tabs are tabs, not spaces
set backspace=indent,eol,start

" Folding
set foldenable                  " auto fold code
set foldmethod=marker           " type of folding

" Other
set smartcase
syntax on           " enable syntax highlighting


" Mappings
" ------------------------------------------------------------------------------

" Mapeia o Home para ir para o primeiro caractere não-branco da linha
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" Alternar entre abas
map <a-s-left> :tabprevious<CR>
map <a-s-right> :tabnext<CR>


" Coding
" ------------------------------------------------------------------------------

setlocal omnifunc=syntaxcomplete#Complete   " activate autocomplete (intellisense)
set cot+=menuone                            " show preview of function prototype
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html,smarty set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
 

" Functions
" ------------------------------------------------------------------------------

" Altera o tamanho do tab para 2
fun! SetTab2()
    set noexpandtab
    set tabstop=2 shiftwidth=2 softtabstop=2
endfun

" Altera o tamanho do tab para 4
fun! SetTab4()
    set noexpandtab
    set tabstop=4 shiftwidth=4 softtabstop=4
endfun

" Altera o tamanho do tab para 2 e usa espaços
fun! SetSpace2()
    set expandtab
    set tabstop=2 shiftwidth=2 softtabstop=2
endfun

" Altera o tamanho do tab para 4 e usa espaços
fun! SetSpace4()
    set expandtab
    set tabstop=4 shiftwidth=4 softtabstop=4
endfun


" File types specific
" ------------------------------------------------------------------------------

au Filetype html,xml,xsl,php,phtml,svg source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

au FileType php,c,cpp,h,hpp,cc,hh,java call SetSpace4()
au Filetype css,javascript call SetSpace4()
au Filetype xhtml,html,phtml,xml,xsl,smarty,svg call SetSpace2()

au BufNewFile,BufRead *.less set filetype=less
au BufNewFile,BufRead *.less call SetSpace2()


" Plugins settings
" ------------------------------------------------------------------------------

