source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2

set nocompatible
syntax on
"colorscheme wombat
let &t_ti.="\e[?7727h"
let &t_te.="\e[?7727l"
noremap <Esc>O[ <Esc>
noremap! <Esc>O[ <Esc>
let &t_ti.="\e[1 q"
"let &t_SI.="\e[8 q" "Makes the cursor dissapear
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
com! FormatJSON %!python -m json.tool
com! AddSNAPSHOTS %s:-version>\(\d\+\.\d\+.\d\+\)<:-version>\1-SNAPSHOT<:g
com! AddAndIncresaseSNAPSHOTS %s:-version>\d\+\.\d\+\.\zs\d\+<:\=submatch(0)+1.'-SNAPSHOT<':g 
com! RemoveSNAPSHOTS %s:-version\(.*\)-SNAPSHOT:-version\1:g
:set wildmenu
:set nu 
:set showmatch
:set ai
:set ts=4
:set sw=4 " treat 4 spaces as a tab when deleting
:set sts=4 " treat 4 spaces as a tab when deleting
:set expandtab " insert spaces instead of \t
:set wrapscan
:set t_Co=256
:colo railscasts
:set hidden
:set switchbuf=usetab,newtab " use an existing tab if one exists for a file, otherwise create a new one
let mapleader = ","
set path+=$PWD/**
filetype off                  " required

set wildmode=longest,list,full
set wildmenu "Turn on WiLd menu
set encoding=utf8
set termencoding=utf8
set ruler "Always show current position

set cmdheight=1 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them

set nobackup
set nowb
set noswapfile

" gvim ctrl-c/v support
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y

" Set to auto read when a file is changed from the outside
set autoread

set nobackup
set nowb
set noswapfile

"if has("gui_running")
"  colo gardener
"  if has("mac")
"    set guifont=Menlo:h12
"  endif
"endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-rails.git'
Plugin 'FuzzyFinder'
Plugin 'skammer/vim-css-color'
Plugin 'pangloss/vim-javascript'
Plugin 'chrismetcalf/vim-json'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Markdown'
Plugin 'burnettk/vim-angular'
Plugin 'mjakl/vim-asciidoc'

"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

au FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
"autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
" You might also find this useful
"
au BufNewFile,BufRead *.{php,phpt} call PHPSettings()

"let g:phpErrorMarker#openQuickfix=0
"let g:phpErrorMarker#automake = 1

function! PHPSettings()
    :set ts=2
    :set sw=2 " treat 2 spaces as a tab when deleting2
    :set sts=2 " treat 2 spaces as a tab when deleting
    " highlight anything over 80 chars
    highlight OverLength ctermbg=darkred ctermfg=grey guibg=#FFD9D9 
    highlight Error ctermbg=darkred ctermfg=grey guibg=#FFD9D9 
    match OverLength /\%>80v.\+/
    let php_sql_query=1                                                                                        
    let php_htmlInStrings=1
endfunction

"Line number coloring
highlight LineNr guifg=#050505
highlight LineNr ctermfg=grey

" Folding
" http://smartic.us/2009/04/06/code-folding-in-vim/
"set foldmethod=indent
"set foldnestmax=10
"set foldlevel=1
"set foldnestmax=2

" CTags config
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Ctags_Cmd = "ctags"
let Tlist_WinWidth = 40
map <F4> :TlistToggle<cr>
map <F6> :NERDTreeToggle<cr>
map <F7> :FormatJSON<cr>
map <F8> :!ctags .<CR>
" More ctags stuff: http://amix.dk/blog/post/19329 
" Generate ctags data for a PHP project: ctags-exuberant -f ~/.vim/mytags/mendeley -h ".php" -R --totals=yes --tag-relative=yes --PHP-kinds=+cf --regex-PHP='/abstract class ([^ ]*)/\1/c/' --regex-PHP='/interface ([^ ]*)/\1/c/' --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'

nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
    if exists("s:maximize_session")
        exec "source " . s:maximize_session
        call delete(s:maximize_session)
        unlet s:maximize_session
        let &hidden=s:maximize_hidden_save
        unlet s:maximize_hidden_save
    else
        let s:maximize_hidden_save = &hidden
        let s:maximize_session = tempname()
        set hidden
        exec "mksession! " . s:maximize_session
        only
    endif
endfunction

