if !has('python3')
    echo 'Error: required vim compile with python'
    finish
endif


function! VXDict(word)
python3 << EOF

import vim
import urllib

DICT_URL = "http://47.112.110.227:8082/xwtools/dict.php?word=%s" 

#for special charator in URL, replace space with %20
word = vim.eval('a:word').replace(" ", "%20")

url = DICT_URL % (word)
try:
    response = urllib.request.urlopen(url)
    data = response.read()
    print(data.decode('utf-8'))
except Exception as e:
    print(e)
EOF
endfunction

command! -nargs=1 Dict :call VXDict(<f-args>)
