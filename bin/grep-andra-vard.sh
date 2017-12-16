#!/usr/bin/env bash

infile=/mnt/usb/output/docx/*.txt

for f in $infile
do
    grep -H -f $f -e "andra världskriget"
done
