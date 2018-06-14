if exists('g:loaded_vxPhpHelp')
    finish
endif
let g:loaded_vxPhpHelp = 1

if !has('python') 
    echo 'Error: required vim compile with python'
    finish
endif

let s:vx_bufname = 'vxPhpHelp'

function! s:SetBuffer()
    if bufloaded(s:vx_bufname) > 0
        execute "sb ".s:vx_bufname
    else
        execute "new ".s:vx_bufname
    endif
    set wrap
"    syn match       qbSplit "^\s*\zs#.*$"
"    hi def link     qbSplit        Comment
    set buftype=nofile
endfunction


function! s:vxPhpHelp(funcName)
    call s:SetBuffer()

python << EOF

PHP_URL = "http://www.php.net/manual/zh/function.%s.php"

import vim
import re
import urllib2
from sgmllib import SGMLParser

class phpHelp(SGMLParser):
    def __init__(self):
        SGMLParser.__init__(self)
        self.text = ''
        self.is_refentry = 0
        
    def addLine(self):
        vim.current.buffer.append(self.text)
        self.text = ''

    def start_div(self, attrs):
        for attr in attrs:
            if attr[0] == "class" and attr[1] == "refentry":
                self.is_refentry = 1
                
    def end_div(self):
        if self.is_refentry == 1:
            self.addLine()

    def start_section(self, attrs):
        for attr in attrs:
            if attr[0] == "id" and attr[1] == "usernotes":
                self.is_refentry = 0
                
    def end_section(self):
        if self.is_refentry == 1:
            self.addLine()

    def unknown_starttag(self,tag,attrs):
        if self.is_refentry and (tag == "br" or tag == "dd"):
            self.addLine()

    def unknown_endtag(self,tag):
        if self.is_refentry:
            if tag in ["h1", "h2", "h3", "h4", "h5", "br", "p", "li", "tr", "dt"]:
                self.addLine()
            elif tag == "td":
                self.text += " "

    def handle_data(self, text):
        if self.is_refentry == 1:
            #erase \n and space char
            self.text += re.sub("\s*\n\s*", " ", text)

    #def handle_charref(self, text):
    def handle_entityref(self, text):
        if self.is_refentry == 1:
            if text == 'nbsp':
                self.text += ' '
            elif text == 'gt':
                self.text += '>'
            elif text == 'lt':
                self.text += '<'
            elif text == 'ndash':
                self.text += '-'
            elif text == 'mdash':
                self.text += '--'
            elif text == ' quot':
                self.text += '"'
            elif text == 'amp':
                self.text += '&'

    def help(self, funcName):
        url = PHP_URL % funcName.replace('_', '-')
        #url = "http://127.0.0.1/mytest.htm"
        try:
            content = urllib2.urlopen(url).read()
        except Exception, e:
            vim.current.buffer.append(e)
            return

        self.feed(content)
        
vim.current.buffer[:] = None
phpHelp().help(vim.eval('a:funcName'))

EOF

endfunction

command! -nargs=1 Php :call s:vxPhpHelp(<f-args>)
