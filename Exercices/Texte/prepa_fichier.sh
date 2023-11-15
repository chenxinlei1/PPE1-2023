#!/usr/bin/env bash

file=$1

if [ $# -ne 1 ]
then
	echo "Ce script demande en argument un fichier texte"
	exit
fi

if [ ! -f "$file" ]
then

    echo "Le fichier spécifié n'existe pas."

    exit
fi

grep -oE '\w+' $file | sed 's/[[:upper:]]*/\L&/g'

#grep -P -o '\p{latin}+' | tr '[:upper:]' '[:lower:]' | tr  'ÉÀÂÈ' 'éàâè'

