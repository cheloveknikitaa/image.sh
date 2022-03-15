#!/bin/bash
if [ "$#" -lt 1 ] ; then
    files=$(find ./ -iname '*.jpg' -and \! -iname '*_thumbnail.jpg')
else
    files=$(cat $1)
fi

for file in $files ;
do
    
    width=$(identify -format "%w" $file)
    height=$(identify -format "%h" $file)
    if [ $width -gt $height ] ; then
        echo "width"
        convert $file -resize 320! ${file/.jpg/_thumbnail.jpg}
    else
        echo "height"
        convert $file -resize x320! ${file/.jpg/_thumbnail.jpg}
    fi
done


# for file in *.jpg ; do convert $file -resize 830 $file; done
# find ./ -iname '*.jpg' -and \! -iname '*_thumbnail.jpg' -exec convert \{} -resize 320\> \{} \;