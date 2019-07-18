" ********** start setup for Vundle ************
set nocompatible	" Use Vim defaults (much better!)
filetype off        " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugin 'tpope/vim-fugitive'
"Plugin 'git://git.wincent.com/command-t.git'
" Plugin 'file:///home/gmarik/path/to/plugin'
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'ascenator/L9', {'name': 'newL9'}
" Plugin 'file:///root/software/command-t-master/'

Plugin 'marsnut/nightpearl'
Plugin 'marsnut/vim-utils'

Plugin 'MiniBufExpl.vim'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'
Plugin 'kien/ctrlp.vim'

"Plugin 'Conque-Shell'
Plugin 'dbext.vim'

Plugin 'Markdown'
Plugin 'vimwiki'
"Plugin 'Vimpress'
Plugin 'DoxygenToolkit.vim'

Plugin 'taglist.vim'
"Plugin 'c.vim'
Plugin 'Emmet.vim'
Plugin 'Visual-Mark'

Plugin 'L9'
Plugin 'Syntastic'
"Plugin 'OmniCppComplete'
Plugin 'AutoComplPop'
Plugin 'SuperTab'
Plugin 'snipMate'

Plugin 'joonty/vim-sauce'
Plugin 'joonty/vim-phpqa'
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
Plugin 'posva/vim-vue'

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

" colorscheme desert
colorscheme darkblue
" colorscheme molokai
" colorscheme vick
" colorscheme lost-shrine
" colorscheme nightpearl
" set background=dark

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
set ignorecase
set autoindent
set smartindent
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
  syntax on
  set hlsearch
endif

filetype plugin on

if &term=="xterm" || &term=="xterm-256color"
     set t_Co=256
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"

" MiniBufExpl
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
"let g:miniBufExplForceSyntaxEnable = 1  
"let g:miniBufExplorerMoreThanOne = 2

" Taglist
let Tlist_WinWidth=20
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window = 1

" The-NERD-tree
let g:NERDTreeWinSize = 24
let g:NERDTreeIgnore = ['\.pyc$']
" let g:NERDTreeShowBookmarks=1

" ctrlp
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v(\.git|\.hg|\.svn\|vendor|node_modules|tmp)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1

let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_mruf_max = 500
let g:ctrlp_follow_symlinks = 1

let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 0
let g:ctrlp_line_prefix = '♪ '

" DoxygenToolkit
let g:DoxygenToolkit_briefTag_pre="\Brief  "
let g:DoxygenToolkit_paramTag_pre="\Param "
let g:DoxygenToolkit_returnTag="\Returns   "
let g:DoxygenToolkit_authorName="vicky xiao"
let g:DoxygenToolkit_licenseTag="GPL"
let g:DoxygenToolkit_fileTag = "\\file "
let g:DoxygenToolkit_dateTag = "\\date "
let g:DoxygenToolkit_versionTag = "\\version "
"let g:DoxygenToolkit_blockHeader="-----------------------------------------------"
"let g:DoxygenToolkit_blockFooter="-----------------------------------------------"
"let g:DoxygenToolkit_commentType = "C++"
"let g:DoxygenToolkit_templateParamTag_pre = "\\tparam "
"let g:DoxygenToolkit_blockTag = "\\name "
"let g:DoxygenToolkit_classTag = "\\class "

" SuperTab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"let g:snippets_dir = '~/vimfiles/bundle/snipMate/snippets/'

" Emmet
let g:user_emmet_mode='a'
let g:user_emmet_install_global=0
autocmd FileType html,css,xml,php,twig EmmetInstall

" omnifunc set
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" vim-vue
autocmd FileType vue syntax sync fromstart
au BufNewFile,BufRead *.html,*.js,*.vue set tabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue set softtabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue set shiftwidth=2
au BufNewFile,BufRead *.html,*.js,*.vue set expandtab
au BufNewFile,BufRead *.html,*.js,*.vue set autoindent
au BufNewFile,BufRead *.html,*.js,*.vue set fileformat=unix

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" vimwiki
"let g:vimwiki_use_mouse=1
let g:vimwiki_list = [{'path': '~/.vimwiki/',
\ 'path_html': '/home/wwwroot/wiki',
\ 'template_path': '~/.vimwiki/template',
\ 'template_default': 'default.tpl'},
\{'path':'/root/wiki',
\ 'path_html': '/home/wwwroot/wiki1'}]

let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,br,hr,a'
let g:vimwiki_use_calendar=1

" Calendar
"map <F8> :Calendar<cr>

" dbext
let g:dbext_default_profile_mysql_laracms = 'type=MYSQL:user=root:passwd=vicky2art190315V:dbname=laracms:extra=-t'
let g:plantuml_executable_script='java -jar ~/bin/plantuml.jar -o /home/wwwroot/wiki/uml/dstimg/ctcm'

" *** SHORTCUT ***
" CtrlD
let g:ctrlp_map = '<Leader>p'
nmap <Leader>f :CtrlPMRUFiles<CR>
nmap <Leader>b :CtrlPBuffer<CR>

" The-NERD-tree
nmap <silent><leader>tt :NERDTreeToggle<CR>
"nmap <silent><F4> :NERDTreeToggle<CR>
nmap <silent>tl :TlistToggle<CR>

nnoremap <F5> :w<CR> :make<CR>
inoremap <F5> <Esc>:w<CR>:silent make<CR>
vnoremap <F5> :<C-U>:w<CR>:silent make<CR
inoremap jj <esc>

nmap <leader>cd :r!curl -s http://47.112.110.227:8082/xwtools/get.php<CR>

source ~/.vim/myplugin/dict.vim
source ~/.vim/myplugin/putData.vim
