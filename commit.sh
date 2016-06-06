#!/bin/bash
echo $0 $1
git add *
git commit -m "first commit"
git remote add origin https://github.com/martinp321/kickingItAround-x86-ASM-linux.git
git push -u origin master
