#!/bin/bash
if [ $# -lt 1 ] ; then
    files=$(find ./ -iname '*.jpg' -and \! -iname '*_thumbnail.jpg')
else
    files=$(grep '.jpg' $@ | grep -v '_thumbnail.jpg')
fi

for file in $files ;
do
    if [ -f $file ]; then
        width=$(identify -format "%w" $file)
        height=$(identify -format "%h" $file)
        if [ $width -gt $height ] ; then
            convert $file -resize 320! ${file/.jpg/_thumbnail.jpg}
        else
            convert $file -resize x320! ${file/.jpg/_thumbnail.jpg}
        fi
    fi
done
