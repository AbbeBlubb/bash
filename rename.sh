#!/bin/bash

## Delete "00 " from filenames in folder.
# When downloaded my music files from Google Music, lot's of files started with "00 <filename>"

for file in *.mp3; do
	if [[ $file == 00[[:space:]]* ]]
	then
		mv "$file" "${file#00 }"
		echo -e "Renamed from: $file\n        to:      ${file#00 }";
	else
		echo "$file didn't match test"
	fi 
done


# mv "$file" "${file%.txt}x.txt"
# Hash inside expansion.
# http://wiki.bash-hackers.org/syntax/pe#from_the_end

# mv "$file" "${file#00 }.txt"
# % inside expansion.
# https://wiki.bash-hackers.org/syntax/pe#from_the_beginning
