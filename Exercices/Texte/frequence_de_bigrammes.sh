#!/usr/bin/env bash


if [ $# -lt 1 ]; then
    echo "Ce script demande en argument un fichier texte"
    exit 1
fi

file=$1
nombre_de_mot=$2

if [ ! -f "$file" ]
then

    echo "Le fichier spécifié n'existe pas."

    exit
fi

if [ -z "$2" ]
then
    nombre_de_mot=25
fi

cat $file | grep -oE '\w+' $file | sed 's/[[:upper:]]*/\L&/g' > texte.txt


tail -n +2 texte.txt > texte1.txt
head -n -1 texte.txt > texte2.txt


paste texte2.txt texte1.txt > bigrammes.txt

sort bigrammes.txt | uniq -c | sort -nr | head -n $nombre_de_mot > frequence_bigrammes.txt


