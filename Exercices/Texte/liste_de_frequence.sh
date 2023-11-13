#!/usr/bin/env bash

file=$1
nombre_de_mot=$2

if [ $# -lt 1 ]
then
	echo "Ce script demande en argument un fichier texte"
	exit
fi

if [ -z "$2" ]
then
    nombre_de_mot=25
fi

./prepa_fichier.sh "$file" | sort | uniq -c | sort -nr | head -n $nombre_de_mot
