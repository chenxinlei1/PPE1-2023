#!/usr/bin/env bash

if [ $# -ne 1 ]
then
    echo "Ce script a besoin d'un argument : <chemin du fichier>."
    exit
fi

chemin="$1"

if [ ! -f "$chemin" ]
then

    echo "Le fichier spécifié n'existe pas."

    exit
fi

N=1

while read -r line
do
    http_response=$(curl -I -s "${line}")
    http_code=$(echo "$http_response" | grep -oE 'HTTP/[0-9.]+\s[0-9]+' | awk '{print $2}')
    encoding=$(echo "$http_response" | grep -i 'Content-Type' | grep -oP 'charset=\K([-A-Za-z0-9]+)')

	if [ -z "$encoding" ]
    then
        encoding="N/A"
    fi
	echo -e "${N}\t${line}\t$http_code\t$encoding"
	N=$(expr $N + 1)

done < "$chemin"
