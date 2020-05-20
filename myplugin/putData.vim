if !has('python3')
    echo 'Error: required vim compile with python'
    finish
endif

function! PutData(args)
python3 << EOF

import vim
from urllib import parse, request

URL = 'http://47.112.110.227:8082/xwtools/put.php'

args = vim.eval('a:args')

pos = args.split('*')
addline = ''
if len(pos) > 1:
    if len(pos[1]) > 0:
        addline = '***' + pos[1] + '***'
    else:
        addline = '    '

start = pos[0]
pos = start.split(',')
if len(pos)==1:
    cursor = vim.current.window.cursor
    end =  cursor[0]
    start = int(start)
    if start == 0:
        start = end

    start = int(start)
else:
    start = pos[0]
    end = pos[1]

start = int(start)
end = int(end)
if end < start:
    pos = end
    end = start
    start = pos

data = ""
for i in range(int(start)-1,int(end)):
    data += vim.current.buffer[i];
    data += '\n'
    
try:
    values = {}
    values['data'] = data;
    if len(addline) > 0:
        values['addline'] = addline;

    url_data = bytes(parse.urlencode(values), encoding='utf-8')
    requests = request.Request(url=URL, data=url_data)
    response = request.urlopen(requests)
    data = response.read()
    print(data)
except Exception as e:
    print(e)

EOF
endfunction

command! -nargs=1 Put :call PutData(<f-args>)
