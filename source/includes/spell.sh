#!/bin/bash

for f in *.md
do
	echo "===== ${f}"
	cat ${f} | grep -v "modeline.*vim:" | aspell --lang=en list | grep -v -F -f spell.ignore | sort | uniq -c | sort -nr
	echo
done
