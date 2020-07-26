## rename.sh

Non-recursive first version:

```
for file in *.mp3; do
	if [[ $file == 00[[:space:]]* ]]
	then
		mv "$file" "${file#00 }"
		echo -e "Renamed from: $file\n        to:      ${file#00 }";
	else
		echo "$file didn't match test"
	fi 
done
```

Recursive second version:

```
find . -type f -name "00[[:space:]]*.mp3" -print0 | while read -d $'\0' filename
do
	mv "$filename" "${file//00 /}"
	echo -e "Renamed from: $filename\n        to:    ${filename//00 /}";
done
```

- While-loop executes while find is executing
- -print0 sets elimeter to null instead of newline, read uses null as delimeter and sets the value to var filename
  - https://explainshell.com/explain?cmd=find%20.%20-type%20f%20-print0
- Parameter expansion with search and replace in expansion time
  - https://wiki.bash-hackers.org/syntax/pe#search_and_replace