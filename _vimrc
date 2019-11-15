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

set rtp+=~/.vim/bundle/Vundle.vim/
let path='~/.vim/bundle'
call vundle#begin(path)

Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/EditPlus'
Plugin 'marsnut/nightpearl'

Plugin 'MiniBufExpl.vim'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'
"Plugin 'FuzzyFinder'
"Plugin 'wincent/command-t'
Plugin 'kien/ctrlp.vim'

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
Plugin 'OmniCppComplete'
Plugin 'AutoComplPop'
Plugin 'SuperTab'
Plugin 'snipMate'

Plugin 'joonty/vim-sauce'
Plugin 'joonty/vim-phpqa'
"Plugin 'joonty/vim-taggatron'
"Plugin 'EasyMotion'
"Plugin 'beyondwords/vim-twig'

Plugin 'phpvim'
Plugin 'JavaScript-syntax'
Plugin 'python.vim'
Plugin 'dbext.vim'
Plugin 'fugitive.vim'
Plugin 'posva/vim-vue'

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

" colorscheme EditPlus
" colorscheme oasis
" colorscheme darkblue
" colorscheme vick
" colorscheme shrine
colorscheme nightpearl

set background=light

set guifont=Fixedsys:h12:cANSI
" set guifont=Courier_New:h14:cANSI  

set lines=32 columns=160

set encoding=utf-8
set fileencodings=utf-8,gbk,gb18036,latin-1

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

set noundofile
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

" MiniBufExpl
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
"let g:miniBufExplForceSyntaxEnable = 1  
"let g:miniBufExplorerMoreThanOne = 2

" The-NERD-tree
let g:NERDTreeWinSize = 20

" TagList
let Tlist_WinWidth=20
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window = 1

" ctrlp 
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
nmap <Leader>f :CtrlPMRUFiles<CR>
nmap <Leader>b :CtrlPBuffer<CR>

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

nmap <silent>tt :NERDTreeToggle<CR>
nmap <silent>tl :TlistToggle<CR>

" SuperTab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

" let g:snippets_dir = '~/vimfiles/bundle/snipMate/snippets/'

" emmet
let g:user_emmet_mode='a'
let g:user_emmet_install_global=0
let g:user_emmet_settings = {
\ 'wxss': {
\   'extends': 'css',
\ },
\ 'wxml': {
\   'extends': 'html',
\   'aliases': {
\     'div': 'view',
\     'span': 'text',
\   },
\   'default_attributes': {
\     'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
\     'navigator': [{'url': '', 'redirect': 'false'}],
\     'scroll-view': [{'bindscroll': ''}],
\     'swiper': [{'autoplay': 'false', 'current': '0'}],
\     'icon': [{'type': 'success', 'size': '23'}],
\     'progress': [{'precent': '0'}],
\     'button': [{'size': 'default'}],
\     'checkbox-group': [{'bindchange': ''}],
\     'checkbox': [{'value': '', 'checked': ''}],
\     'picker': [{'bindchange': ''}],
\     'radio-group': [{'bindchange': ''}],
\     'radio': [{'checked': ''}],
\     'switch': [{'checked': ''}],
\     'slider': [{'value': ''}],
\     'action-sheet': [{'bindchange': ''}],
\     'modal': [{'title': ''}],
\     'loading': [{'bindchange': ''}],
\     'toast': [{'duration': '1500'}],
\     'image': [{'src': '', 'mode': 'scaleToFill'}],
\   },
\ },
\}
"\     'label': [{'for': ''}],
"\     'input': [{'type': 'text'}],
"\     'form': [{'bindsubmit': ''}],
autocmd FileType html,css,xml,php,vue,wxss,wxml EmmetInstall

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss set tabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss set softtabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss set shiftwidth=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss set expandtab
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss set autoindent
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss set fileformat=unix

" syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"set connections for dbext
let g:dbext_default_profile_mysql_cms= 'type=MYSQL:user=root:passwd=123:dbname=wcn_cmssite:extra=-t:host=111.101.169.49'

nmap <leader>cd :r!curl -s http://47.111.111.227:8082/xwtools/get.php<CR>

source $VIM/myplugin/dict.vim
source $VIM/myplugin/phphelp.vim
source $VIM/myplugin/putData.vim
source $VIM/myplugin/qiushibaike.vim
