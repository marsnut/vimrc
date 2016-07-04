set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set guioptions-=T           " hide menu bar
set guioptions-=m           " hide toolbar
map <silent> <F12> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

filetype off

set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

Plugin 'gmarik/Vundle.vim'

"Plugin 'Colo-u-r-Sampler-Pack'
Plugin 'molokai'
Plugin 'Zenburn'

Plugin 'MiniBufExpl.vim'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'
Plugin 'FuzzyFinder'

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
Plugin 'dbext.vim'

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed.

filetype plugin on

" colorscheme darkblue
" set guifont=Fixedsys:h12:cANSI
" set guifont=Courier_New:h14:cANSI  

set lines=32 columns=160

set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1

if has("win32")
  set fileencoding=chinese
else
  set fileencoding=utf-8
endif


"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"解决console输出乱码
language messages zh_CN.utf-8

set backspace=indent,eol,start

set nobackup
set ignorecase
set history=50		" keep 50 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch		" do incremental searching
set tabstop=4
set shiftwidth=4
set expandtab       "tranfer tab to 4 spaces
set autoindent
set smartindent
set showmatch

set nu

map Q gq
vmap <C-X> "+x
vmap <C-C> "+y
nmap <C-V> "+gP

inoremap <C-U> <C-G>u<C-U>

if has('mouse')
  set mouse=a
endif


let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 

let g:NERDTreeWinSize = 20

let Tlist_WinWidth=20
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window = 1

"let g:winManagerWindowLayout='FileExplorer'
"nmap wm :WMToggle<cr>

nnoremap <leader>ff :FufFile<CR> 
nnoremap <leader>fb :FufBuffer<CR> 
nmap <silent><F4> :NERDTreeToggle<CR>
nmap <silent><F8> :TlistToggle<CR>


"代码补全，用TAB键激活
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"

let g:snippets_dir = '~/vimfiles/bundle/snipMate/snippets/'

let g:user_emmet_mode='a'
let g:user_emmet_install_global=0
autocmd FileType html,css,xml,php,twig EmmetInstall

"set connections for dbext
let g:dbext_default_profile_mysql_vxframe = 'type=MYSQL:user=root:passwd=root:dbname=vxframe:extra=-t'
let g:dbext_default_profile_mysql_wcn = 'type=MYSQL:user=root:passwd=hkcd1862:dbname=wcn_transition:extra=-t:host=203.85.54.57'
let g:dbext_default_profile_mysql_hkcd = 'type=MYSQL:user=root:passwd=hkcd1862:dbname=wcn_transition:extra=-t:host=152.101.169.49'
let g:dbext_default_profile_sqlite = 'type=SQLITE:SQLITE_bin=C:\Programs\POPFile\sqlite.exe:dbname=C:\Programs\POPFile\popfile.db'

let g:dbext_default_profile_mysql_cmssite = 'type=MYSQL:user=root:passwd=hkcd1862:dbname=wcn_cmssite:extra=-t:host=203.85.54.57'
let g:dbext_default_profile_mysql_global = 'type=MYSQL:user=root:passwd=hkcd1862:dbname=global:extra=-t:host=203.85.54.57'

source c:/program files/vim/my-plugin/Dict.vim
source c:/program files/vim/my-plugin/phphelp.vim
source c:/program files/vim/my-plugin/qiushibaike.vim
