#!/bin/bash

# Delete "00 " from filenames in folders.
# When downloaded my music files from Google Music, lot's of files started with "00 <filename>"

find . -type f -name "00[[:space:]]*.mp3" -print0 | while read -d $'\0' file
do
	mv "$file" "${file//00 /}"
	echo -e "Renamed from: $file\n        to:   ${file//00 /}";
done
