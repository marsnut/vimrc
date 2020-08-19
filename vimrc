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
" Plugin 'file:///root/software/command-t-master/'

Plugin 'marsnut/nightpearl'
Plugin 'marsnut/vim-utils'
" Plugin 'lifepillar/vim-colortemplate'

Plugin 'MiniBufExpl.vim'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'

"Plugin 'Conque-Shell'
Plugin 'dbext.vim'

Plugin 'Markdown'
Plugin 'vimwiki'
"Plugin 'Vimpress'
Plugin 'DoxygenToolkit.vim'

Plugin 'Yggdroot/LeaderF'
"Plugin 'taglist.vim'
"Plugin 'c.vim'
Plugin 'Emmet.vim'
Plugin 'Visual-Mark'

Plugin 'L9'
Plugin 'dense-analysis/ale'
"Plugin 'Syntastic'
"Plugin 'OmniCppComplete'
Plugin 'AutoComplPop'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'SuperTab'
"Plugin 'snipMate'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'joonty/vim-sauce'
"Plugin 'joonty/vim-phpqa'
"Plugin 'joonty/vim-taggatron'
"Plugin 'EasyMotion'
"Plugin 'beyondwords/vim-twig'

"Plugin 'phpvim'
Plugin 'JavaScript-syntax'
Plugin 'python.vim'
Plugin 'itchyny/calendar.vim'
Plugin 'aklt/plantuml-syntax'
Plugin 'AD7six/vim-activity-log'
"Plugin 'mhinz/vim-signify'
Plugin 'fugitive.vim'
Plugin 'posva/vim-vue'
Plugin 'Rykka/colorv.vim'
Plugin 'mattn/webapi-vim'
Plugin 'lervag/vimtex'

Plugin 'skywind3000/asyncrun.vim'
Plugin 'ludovicchabant/vim-gutentags'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" source %
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" ********** end setup for Vundle *****************

" colorscheme desert
" colorscheme darkblue
" colorscheme vick
" colorscheme shrine
colorscheme nightpearl

highlight Pmenu  ctermbg=lightgrey ctermfg=black
highlight PmenuSel  ctermbg=green ctermfg=black
" :hi SignColor ctermfg=red ctermbg=blue guifg=white guibg=RoyalBlue3
" highlight SignColor ctermfg=white ctermbg=blue guifg=white guibg=RoyalBlue3

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
"let Tlist_WinWidth=20
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window = 1

" The-NERD-tree
let g:NERDTreeWinSize = 24
let g:NERDTreeIgnore = ['\.pyc$']
" let g:NERDTreeShowBookmarks=1
nmap <silent><leader>tt :NERDTreeToggle<CR>
"nmap <silent>tl :TlistToggle<CR>
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k

" LeaderF
let g:Lf_ShortcutF = '<leader>fi'
let g:Lf_ShortcutB = '<leader>bb'
noremap <leader>ff :LeaderfFunction!<cr>
noremap <leader>fm :LeaderfMru<cr>
noremap <leader>ft :LeaderfTag<cr>
noremap <leader>fl :LeaderfLine<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \}
let g:Lf_NormalMap = {
	\ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
	\ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
	\ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
	\ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
	\ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
	\ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
  \ }

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

" ultisnips
" Trigger configuration. Do not use <tab> if you use YCM.
let g:UltiSnipsExpandTrigger="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" UltiSnipsEdit! edit current filetype snips

" Emmet
let g:user_emmet_mode='a'
let g:user_emmet_install_global=0
autocmd FileType html,css,xml,php,vue,wxss,wxml EmmetInstall
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

" AutoComplPop
au FileType php setlocal dict+=~/.vim/bundle/AutoComplPop/php_funclist.txt
" if !exists('g:AutoComplPop_Behavior')
" let g:AutoComplPop_Behavior = {}
" let g:AutoComplPop_Behavior['php'] = []
" call add(g:AutoComplPop_Behavior['php'], {
" \ 'command' :"\\",
" \ 'pattern' : printf('−>∥::∥$\k\{%d,}$', 0),
" \ 'repeat' : 0,
" \})
" endif

" YouCompleteMe
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
" highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
" highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
set completeopt=menu,menuone
noremap <c-z> <NOP>
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }
let g:ycm_filetype_whitelist = { 
            \ "c":1,
            \ "cpp":1, 
            \ "objc":1,
            \ "sh":1,
            \ "zsh":1,
            \ "zimbu":1,
            \ }
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

" omnifunc set
autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" vim-vue
autocmd FileType vue syntax sync fromstart
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss,*.sql set tabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss,*.sql set softtabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss,*.sql set shiftwidth=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss,*.sql set expandtab
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss,*.sql set autoindent
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss,*.sql set fileformat=unix

" syntastic
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" "let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" "set statusline+=%#warningmsg#
" "set statusline+=%{SyntasticStatuslineFlag()}
" "set statusline+=%*

let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_php_phan_minimum_severity = get(g:, 'ale_php_phan_minimum_severity', 0)
"let g:ale_php_phan_executable = './vendor/binphan'
"let g:ale_linters = {'php': ['php', 'langserver', 'phan']}

let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {'vue': ['eslint', 'vls'], 'php': ['php', 'langserver', 'phan'] }

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

" Plantuml
let g:plantuml_executable_script='java -jar ~/bin/plantuml.jar -o /home/wwwroot/wiki/uml/dstimg/dute'

" Asyncrun
let g:asyncrun_open = 6
let g:asyncrun_bell = 1

" gutentags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
"let g:gutentags_exclude = ['*.css', '*.html', '*.js']
let g:gutentags_cache_dir = s:vim_tags
" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--php-kinds=+cfit']
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" *** SHORTCUT ***
set sessionoptions=buffers,sesdir,unix
"function! MakeSession()
"  let b:sessiondir = getcwd()
"  let b:filename = b:sessiondir . '/Session.vim'
"  exe "mksession! " . b:filename
"  exe "edit! " . b:filename
"  exe "g:^cd :d"
"  exe "x" 
"endfunction

inoremap jj <esc>
" nnoremap <F5> :w<CR> :make<CR>
" inoremap <F5> <Esc>:w<CR>:silent make<CR>
" vnoremap <F5> :<C-U>:w<CR>:silent make<CR>
" nnoremap <silent><F5> :call CompileRunGcc()<CR><CR>
nnoremap <F5> :call CompileRun()<CR>
inoremap <F5> <Esc> :call CompileRun()<CR>

nnoremap <silent> <F7> :AsyncRun -raw python3 %<CR>
"nnoremap <silent> <F7> :call CompileRun()<CR>
nnoremap <silent> <F9> :AsyncRun -raw source %<CR>
nnoremap <silent> <F10> :call asyncrun#quickfix_toggle(6)<CR>
 
func! CompileRun()
    exec"w"
    if &filetype =='c'
        exec"!g++ % -o %<"
        exec"!time ./%<"
    elseif &filetype =='cpp'
        exec"!g++ % -o %<"
        exec"!time ./%<"
    elseif &filetype =='java'
        exec"!javac %"
        exec"!time java %<"
    elseif &filetype =='sh'
        :!time bash %
    elseif &filetype =='python'
        exec"AsyncRun -raw python3 %"
    elseif &filetype =='html'
        exec"!firefox % &"
    elseif &filetype =='go'
        exec"AsyncRun -raw go build %<"
        exec"AsyncRun -raw go run %"
    elseif &filetype =='mkd'
        exec"!~/.vim/markdown.pl % > %.html &"
        exec"!firefox %.html &"
    elseif &filetype =='plantuml'
        exec"make %"
    endif
endfunc

nmap <leader>cd :r!curl -s http://47.112.119.228:8082/xwtools/get.php<CR>

let g:dbext_default_profile_mysql_artBD = 'type=MYSQL:user=root:passwd=victory:dbname=artBD:extra=-t'

source ~/.vim/myplugin/dict.vim
source ~/.vim/myplugin/phphelp.vim
source ~/.vim/myplugin/putData.vim
