#!/bin/bash

while read url; do
    wget -P ./downloads $url
done < url_out.txt
