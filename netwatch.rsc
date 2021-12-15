add comment=yandex down-script=":local routername [/system identity get name]\r\
    \n:local dstaddr \$host\r\
    \n:local dstaddrdesc Yandex\r\
    \n/tool fetch url=\"https://api.telegram.org/BOTID/sendmessage\\\?chat_id=CHANNEL-ID&text= \$routername netwatch s\
    ay: \$dstaddrdesc (\$dstaddr) is not good\" keep-result=no;" host=77.88.8.8 up-script=":local routername [/system identity get name]\r\
    \n:local dstaddr \$host\r\
    \n:local dstaddrdesc Google\r\
    \n/tool fetch url=\"https://api.telegram.org/BOTID/sendmessage\\\?chat_id=CHANNEL-ID&text= \$routername netwatch s\
    ay: \$dstaddrdesc (\$dstaddr) is good\" keep-result=no;"
