#!/bin/bash

ENTITE=$1
ANNEE=$2


# Vérifie si les arguments sont fournis correctement
if [ $# -ne 2 ]
then
    echo "Ce script a besoin de deux arguments: <ENTITE> <ANNEE>."
    exit
fi


echo "Nombre de $ENTITE pour l'année $ANNEE :"
cat Fichiers/ann/$ANNEE/*/*.ann|grep "$ENTITE"|cut -f 3|sort|uniq -c|wc -l

