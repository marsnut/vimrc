if exists('g:loaded_vxPhpHelp')
    finish
endif
let g:loaded_vxPhpHelp = 1

if !has('python3') 
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


function! s:vxPhpHelp(fname)
    call s:SetBuffer()

python3 << EOF

import vim
from lxml import etree
import requests


def setContent(content):
    arr = content.split('\n')
    isBlank=True
    item=''

    vim.current.buffer.append('\n')

    for line in arr:
        if len(line.strip()) > 0:
            item += line.strip()
            if isBlank:
                vim.current.buffer.append(item)
                item = ''
                isBlank = False
        else:
            isBlank = True;

    vim.current.buffer.append(item)


vim.current.buffer[:] = None

PHP_URL = "http://www.php.net/manual/zh/function.%s.php"

fname = vim.eval('a:fname').replace("_", "-")
url = PHP_URL % (fname)

html = requests.get(url).content.decode('utf-8')
dom_tree = etree.HTML(html)

refentry  = dom_tree.xpath("//div[@class='refentry']")[0]

refdiv = refentry.xpath("div[@class='refnamediv']")[0]
text = refdiv.xpath('string(.)')
setContent(text)

refdiv = refentry.xpath("div[@class='refsect1 description']")[0]
text = refdiv.xpath('string()')
setContent(text)

refdiv = refentry.xpath("div[@class='refsect1 parameters']")[0]
text = refdiv.xpath('string()')
setContent(text)

refdiv = refentry.xpath("div[@class='refsect1 returnvalues']")[0]
text = refdiv.xpath('string()')
setContent(text)

refdiv = refentry.xpath("div[@class='refsect1 examples']")[0]
title = refdiv.xpath('h3/text()')[0]
vim.current.buffer.append('\n')
vim.current.buffer.append(title)
vim.current.buffer.append('-------------')

ref = refdiv.xpath("//div[@class='example']")
for line in ref:
    title = line.xpath('p')[0].xpath('string()')

    vim.current.buffer.append('\n')
    vim.current.buffer.append('  ' + title)

    vim.current.buffer.append('  ***********')

    codes = line.xpath('div/div/code/span/span')
    item='  '
    for code in codes:
        #br = etree.SubElement(code, 'br')
        #br.tail = '\n'
        text = code.xpath('string()')
        item += text
        if str(etree.tostring(code),encoding='utf-8').find('<br/>') > 0:
            vim.current.buffer.append(item)
            item = '  '

    vim.current.buffer.append(item)

refdiv = refentry.xpath("div[@class='refsect1 notes']")[0]
text = refdiv.xpath('string(.)')
setContent(text)

refdiv = refentry.xpath("div[@class='refsect1 seealso']")[0]
text = refdiv.xpath('string(.)')
setContent(text)

EOF

endfunction

command! -nargs=1 Php :call s:vxPhpHelp(<f-args>)
