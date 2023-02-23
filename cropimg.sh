#!/bin/bash
# NOTE : Quote it else use array to avoid problems #

#Нижче приклад
#jpegtopnm 001.jpg | pnmcut -bottom -60 | pnmtojpeg --quality=90 > 001-result.jpg

echo 'Input number of pixels to crop:'
read n

FILES="./*.jpg"
for f in $FILES
do
  b="$(basename -- $f)"
  echo "$b"
  ff="${b%.*}"
  jpegtopnm "$b" | pnmcut -bottom -"$n" | pnmtojpeg --quality=90 > "$ff-result.jpg"
done