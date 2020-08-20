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

Plugin 'marsnut/nightpearl'
"Plugin 'marsnut/vim-utils'

"Plugin 'vim-scripts/EditPlus'
Plugin 'molokai'
Plugin 'Zenburn'

"Plugin 'MiniBufExpl.vim'
Plugin 'The-NERD-tree'
Plugin 'The-NERD-Commenter'
"Plugin 'FuzzyFinder'
"Plugin 'wincent/command-t'

Plugin 'Yggdroot/LeaderF'
Plugin 'dbext.vim'

Plugin 'Markdown'
Plugin 'vimwiki'
"Plugin 'Vimpress'
Plugin 'DoxygenToolkit.vim'

"Plugin 'taglist.vim'
"Plugin 'c.vim'
Plugin 'Emmet.vim'
Plugin 'Visual-Mark'

Plugin 'L9'
Plugin 'dense-analysis/ale'
" Plugin 'OmniCppComplete'
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

Plugin 'phpvim'
Plugin 'JavaScript-syntax'
Plugin 'python.vim'
Plugin 'fugitive.vim'
Plugin 'posva/vim-vue'
Plugin 'Rykka/colorv.vim'
Plugin 'chemzqm/wxapp.vim'
Plugin 'CoatiSoftware/vim-sourcetrail'
"Plugin 'lervag/vimtex'

Plugin 'skywind3000/asyncrun.vim'
Plugin 'ludovicchabant/vim-gutentags'

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
colorscheme shrine
" colorscheme nightpearl

set background=dark

set guifont=Fixedsys:h12:cANSI
" set guifont=Courier_New:h14:cANSI  

set lines=32 columns=150

set encoding=utf-8
set fileencodings=utf-8,gbk,gb18036,latin-1

if has("win32")
  set fileencoding=chinese
else
  set fileencoding=utf-8
endif

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

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
set nofoldenable

map Q gq
vmap <C-X> "+x
vmap <C-C> "+y
nmap <C-V> "+gP

inoremap <C-U> <C-G>u<C-U>

if has('mouse')
  set mouse=a
endif

" The-NERD-tree
let g:NERDTreeWinSize = 20
let g:NERDTreeIgnore = ['\.pyc$']
" let g:NERDTreeShowBookmarks=1
nmap <silent>tt :NERDTreeToggle<CR>
"nmap <silent>tl :TlistToggle<CR>
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k

" LeaderF
let g:Lf_ShortcutF = '<leader>fi'
let g:Lf_ShortcutB = '<leader>fb'
noremap <leader>ff :LeaderfFunction!<cr>
noremap <leader>fm :LeaderfMru<cr>
noremap <leader>ft :LeaderfTag<cr>
noremap <leader>fl :LeaderfLine<cr>

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowPosition = 'popup'
let g:Lf_PopupWidth = 0.80
let g:Lf_PopupHeight = 0.80
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
"let g:Lf_PopupColorscheme = 'gruvbox_default'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vimses','.vscode','.wine','.deepinwine','.oh-my-zsh'],
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

" emmet
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
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_min_num_identifier_candidate_chars = 2
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
" nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" omnifunc set
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" vim-vue
autocmd FileType vue syntax sync fromstart
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss,*.sql set tabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss,*.sql set softtabstop=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss,*.sql set shiftwidth=2
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss,*.sql set expandtab
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss,*.sql set autoindent
au BufNewFile,BufRead *.html,*.js,*.vue,*.wxml,*.wxss,*.sql set fileformat=unix

" gutentags
"let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
"" 所生成的数据文件的名称 "
"let g:gutentags_ctags_tagfile = '.tags'
"" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
"let s:vim_tags = expand('~/.cache/tags')
""let g:gutentags_exclude = ['*.css', '*.html', '*.js']
"let g:gutentags_cache_dir = s:vim_tags
"" 配置 ctags 的参数 "
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"" 检测 ~/.cache/tags 不存在就新建 "
"if !isdirectory(s:vim_tags)
"   silent! call mkdir(s:vim_tags, 'p')
"endif

"set vimtex
" TelegramTelegramlet g:vimtex_latexmk_options='-pdf -pdflatex="xelatex -synctex=1 \%S \%O" -verbose -file-line-error -interaction=nonstopmode'
" let g:tex_flavor='latex'
" let g:vimtex_view_method='skim'
" let g:vimtex_quickfix_mode=0
" set conceallevel=1
" let g:tex_conceal='abdmg'

nnoremap <F5> :call CompileRunGcc()<CR><CR>
inoremap <F5> ESC :call CompileRunGcc()<CR><CR>
func! CompileRunGcc()
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
        exec"!py %"
    elseif &filetype =='html'
        exec"!firefox % &"
    elseif &filetype =='go'
        exec"!go build %<"
        exec"!time go run %"
    elseif &filetype =='mkd'
        exec"!~/.vim/markdown.pl % > %.html &"
        exec"!firefox %.html &"
    endif
endfunc

" syntastic
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" "let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']
" "set statusline+=%#warningmsg#
" "set statusline+=%{SyntasticStatuslineFlag()}
" "set statusline+=%*

" ale
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
let g:plantuml_executable_script='java -jar ~/bin/plantuml.jar -o /home/wwwroot/wiki/uml/dstimg/artworks'

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

"set sessionoptions=buffers,sesdir,options,slash
set sessionoptions=buffers,sesdir,slash
"function! MakeSession()
"  let b:sessiondir = getcwd()
"  let b:filename = b:sessiondir . '/Session.vim'
"  exe "mksession! " . b:filename
"  exe "edit! " . b:filename
"  exe "g:^cd :d"
"  exe "x" 
"endfunction

"function! MakeSession()
"  let b:sessiondir = getcwd()
"  let b:filename = b:sessiondir . '/_vimsession'
"  exe "mksession! " . b:filename
"  exe "edit! " . b:filename
"  " Delete the line start with 'cd ...'
"  exe "g:^cd :d"
"  " Vim complains about b:sessiondir being undefined. So I use getcwd() directly
"  " exe "%s:" . b:sessiondir . "::g". Use ':' to avoid path escape
"  exe "%s:" . getcwd() . "/::g"
"  " Save with 'x'
"  exe "x"
"endfunction

" inoremap jj <esc>
" nnoremap <F5> :w<CR> :make<CR>
" inoremap <F5> <Esc>:w<CR>:silent make<CR>
" vnoremap <F5> :<C-U>:w<CR>:silent make<CR>
" nnoremap <silent><F5> :call CompileRunGcc()<CR><CR>
nnoremap <F5> :call CompileRun()<CR>
inoremap <F5> <Esc> :call CompileRun()<CR>

nnoremap <silent> <F7> :AsyncRun -raw python %<CR>
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
        exec"!time python %"
    elseif &filetype =='html'
        exec"!firefox % &"
    elseif &filetype =='go'
        exec"!go build %<"
        exec"!time go run %"
    elseif &filetype =='mkd'
        exec"!~/.vim/markdown.pl % > %.html &"
        exec"!firefox %.html &"
    elseif &filetype =='plantuml'
        exec"make %"
    endif
endfunc

nmap <leader>cd :r!curl -s http://47.112.110.227:8082/xwtools/get.php<CR>

"set connections for dbext
let g:dbext_default_profile_mysql_vx = 'type=MYSQL:user=root:passwd=victory:dbname=vxframe:extra=-t'

source $VIM/myplugin1/dict.vim
source $VIM/myplugin/phphelp.vim
source $VIM/myplugin/putData.vim
"source $VIM/myplugin/qiushibaike.vim
