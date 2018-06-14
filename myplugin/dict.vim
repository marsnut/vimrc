" vim plugin for youdoa translation
if !has('python')
    echo 'Error: required vim compile with python'
    finish
endif

command! -nargs=1 Dict exec('py vxDict(<f-args>)')

python << EOF

import urllib
import urllib2
from urllib2 import URLError

DICT_URL = "http://152.74.69.152:8081/xwtools/dict.php?word=%s" 
def vxDict(word):
    url = DICT_URL % (word)
    try:
        response = urllib2.urlopen(url)
        data = response.read()
        print data
    except Exception, e:
        print e
        return
EOF
