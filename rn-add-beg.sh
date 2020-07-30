#!/bin/bash

# Add to the beginning of the file name for all files inside the current directory.
# The given arguments (string) will pass to the $@ parameter and a space is added

SUBSTR="${@}" # Args needs to be stored in var as string in order to make mv work properly with spaces

echo "
Given arguments are:          \"$SUBSTR\"
Space will be added, like so: \"$SUBSTR \"
"

find . -maxdepth 1 -type f -print0 | while read -d $'\0' file
do
    mv "$file" "${SUBSTR} ${file#./}"
    echo -e "Renamed from: ${file#./}\n        to:   $@ ${file}";
done

# https://ss64.com/bash/find.html
