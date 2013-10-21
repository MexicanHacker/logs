#!/bin/sh

WGET="wget"

if [ $# -lt 1 -o $# -gt 2 ]; then
        echo "Usage: $0 url [file]"
        exit 1
fi

URL="$1"
if [ $# -eq 1 ]; then
        FILE="${URL##*/}"
else
        FILE="$2"
fi

echo "streaming from $URL to $FILE"

if [ -f "$FILE" ]; then
        SIZE=`stat -c %s $FILE`
else
        SIZE="0"
fi

while true; do
        RSIZE=$($WGET -S --spider "$URL" 2>&1 | grep Content-Length | cut -d ' ' -f 4)
        if [ -z "$RSIZE" ]; then
                echo "an error ocurred, probably invalid url"
                exit 1
        fi
        echo "local size is $SIZE, remote size is $RSIZE"
        if [ "$SIZE" != "$RSIZE" ]; then
                echo "getting changes"
                wget -c -O "$FILE" -q "$URL"
        fi
        SIZE=`stat -c %s $FILE`
        sleep 5
done
