#!/usr/bin/env bash

file=$1

if [ $# -ne 1 ]
then
	echo "Ce script demande en argument un fichier texte"
	exit
fi

grep -oE '\w+' $file | sed 's/[[:upper:]]*/\L&/g' > texte_nettoye.txt

