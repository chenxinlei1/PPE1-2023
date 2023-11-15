#!/usr/bin/env bash

file=$1
nombre_de_mot=$2

if [ $# -lt 1 ]
then
	echo "Ce script demande en argument un fichier texte"
	exit
fi

if [ ! -f "$file" ]
then

    echo "Le fichier spécifié n'existe pas."

    exit
fi

if [ -z "$2" ]
then
    nombre_de_mot=25
fi


if ! [[ "$nombre_de_mot" =~ ^0*[1-9][0-9]*$ ]]
then
	echo "Donnez moi un chiffre !"
	exit
fi

./prepa_fichier.sh "$file" | sort | uniq -c | sort -nr | head -n $nombre_de_mot

