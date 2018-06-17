" ********** start setup for Vundle ************
set nocompatible	" Use Vim defaults (much better!)
filetype off        " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugin 'tpope/vim-fugitive'
" Plugin 'git://git.wincent.com/command-t.git'
" Plugin 'file:///home/gmarik/path/to/plugin'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'molokai'
"Plugin 'Zenburn'
"Plugin 'DrawIt'

Plugin 'MiniBufExpl.vim'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'
Plugin 'FuzzyFinder'

"Plugin 'Conque-Shell'
Plugin 'dbext.vim'

Plugin 'Markdown'
Plugin 'vimwiki'
"Plugin 'Vimpress'
"Plugin 'DoxygenToolkit.vim'

Plugin 'taglist.vim'
"Plugin 'c.vim'
Plugin 'Emmet.vim'
Plugin 'Visual-Mark'

Plugin 'L9'
Plugin 'Syntastic'
"Plugin 'OmniCppComplete'
Plugin 'AutoComplPop'
"Plugin 'SuperTab'
Plugin 'snipMate'

Plugin 'joonty/vim-sauce'
"Plugin 'joonty/vim-phpqa'
"Plugin 'joonty/vim-taggatron'
"Plugin 'EasyMotion'
Plugin 'beyondwords/vim-twig'

Plugin 'phpvim'
Plugin 'JavaScript-syntax'
Plugin 'python.vim'
Plugin 'itchyny/calendar.vim'
Plugin 'aklt/plantuml-syntax'
Plugin 'AD7six/vim-activity-log'
"Plugin 'mhinz/vim-signify'
Plugin 'fugitive.vim'


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" ********** end setup for Vundle *****************

colorscheme vick
"colorscheme molokai
highlight Pmenu  ctermbg=lightgrey ctermfg=black
highlight PmenuSel  ctermbg=green ctermfg=black

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=ucs-bom,utf-8,latin1
endif

set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set tabstop=4
set shiftwidth=4
set expandtab
set showmatch
set number
"set clipboard=unnamedplus

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
  autocmd!
  " In text files, always limit the width of text to 78 characters
  " autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/run/media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add $PWD/cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
"  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm"
     set t_Co=256
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"


let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

let g:NERDTreeWinSize = 24
" let g:NERDTreeShowBookmarks=1

let Tlist_WinWidth=20
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window = 1

nnoremap <leader>ff :FufFile<CR> 
nnoremap <leader>fb :FufBuffer<CR> 
nmap <silent><leader>dm :NERDTreeToggle<CR>
nmap <silent><F8> :TlistToggle<CR>
inoremap jj <esc>

"代码补全，用TAB键激活
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"let g:snippets_dir = '~/vimfiles/bundle/snipMate/snippets/'

let g:user_emmet_mode='a'
let g:user_emmet_install_global=0
autocmd FileType html,css,xml,php,twig EmmetInstall

"let g:vimwiki_use_mouse=1
let g:vimwiki_list = [{'path': '~/vimwiki/',
\ 'path_html': '/home/wwwroot/wiki',
\ 'template_path': '~/vimwiki/template',
\ 'template_default': 'default.tpl'},
\{'path':'/root/wiki',
\ 'path_html': '/home/wwwroot/wiki1'}]

let g:vimwiki_use_calendar=1

"set connections for dbext
"let g:dbext_default_profile_mysql_cms = 'type=MYSQL:user=root:passwd=art2jh2017V:dbname=cms:extra=-t'

let g:plantuml_executable_script='java -jar ~/data/plantuml.jar -o /home/wwwroot/wiki/uml/dstimg/oc'

nnoremap <F5> :w<CR> :make<CR>
inoremap <F5> <Esc>:w<CR>:silent make<CR>
vnoremap <F5> :<C-U>:w<CR>:silent make<CR
inoremap jj <esc>

nmap <leader>cd :r!curl -s http://152.74.69.152:8082/xwtools/get.php<CR>

source ~/.vim/myplugin/dict.vim
source ~/.vim/myplugin/putData.vim
source ~/.vim/myplugin/phphelp.vim
