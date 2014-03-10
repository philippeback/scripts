#!/bin/bash

if [ -d "${1}" ] ; then
  cd "${1}"
else
  echo "Error: bad argument. Expected a valid directory name for the first argument"
  echo "Bad directory name = ${1}"
  exit 1
fi
shopt -s nullglob
for i in *.md
do
    echo "Processing $i"
    fname=`basename $i`
    fbname=${fname%.*}
    pandoc -o $fbname.docx $i 
done
