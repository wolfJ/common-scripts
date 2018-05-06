#!/bin/bash

if [ ! $1 ]; then
	echo "Usage: `basename $0` folder_path"
	exit 0
fi

find $1 -maxdepth 1 -type d | while read dir; do
count=$(find "$dir" -type f | wc -l)
echo "$dir : $count"
done
