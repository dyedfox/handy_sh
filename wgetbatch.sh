#!/bin/bash


# I know that this function is available in wget but it's just training :)

while read url; do
    wget -P ./downloads $url
done < url_out.txt
