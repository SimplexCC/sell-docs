#!/bin/bash

for f in *.md
do
	aspell --lang=en_US check $f
done
