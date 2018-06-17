if !has('python')
    echo 'Error: required vim compile with python'
    finish
endif

command! -nargs=1 Put exec('py putData(<f-args>)')

python << EOF

import vim
import urllib
import urllib2

URL = 'http://152.74.69.152:8082/xwtools/put.php'

def putData(args):
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

        url_data = urllib.urlencode(values)
        request = urllib2.Request(url=URL, data=url_data)
        response = urllib2.urlopen(request)
        data = response.read()
        print data
    except Exception, e:
        print e

EOF
