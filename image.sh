#!/bin/bash
if [ "$#" -lt 1 ] ; then
    files="*.jpg"
else
    files=$(cat $1)
fi

for file in $files ;
do
    if identify -format "%w" $file > identify -format "%h" $file ; then
        convert $file -resize 320 _thumbnail$file
    else
        convert $file -resize x320 _thumbnail$file
    fi
done


# for file in *.jpg ; do convert $file -resize 830 $file; done
# find ./ -iname '*.jpg' -and \! -iname '*_thumbnail.jpg' -exec convert \{} -resize 320\> \{} \;