#!/usr/bin/env bash

infile=/mnt/usb/output/docx/*

for f in $infile
do
    docx2txt $f
done

