#!/bin/bash

if [ "$1" == "clean" ]; then
	rm scpt/*
	exit
fi

if [ ! -d scpt ]; then
	mkdir scpt
fi

for file in *.applescript; do
	osacompile -o scpt/${file%.applescript}.scpt $file
done
