#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
git ls-files | grep '.gpg' | while read file; do
	decrypt -d -y $file
done
