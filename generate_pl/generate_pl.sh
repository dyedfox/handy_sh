#!/bin/bash
set -e

filename="${1:-pl}"

echo "#EXTM3U" > $filename.m3u

find "$(pwd)" -type f | grep .mp3 >> "$filename.m3u" && find "$(pwd)" -type f | grep .ogg >> "$filename.m3u" \
&& find "$(pwd)" -type f | grep .m4a >> "$filename.m3u"