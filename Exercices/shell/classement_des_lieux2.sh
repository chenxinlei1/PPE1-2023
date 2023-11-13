#!/bin/bash

ANNEE=$1
MOIS=$2
NOMBRE_DE_LIEUX=$3

if [ $# -ne 3 ]
then
    echo "Ce script a besoin de trois arguments: <ANNEE> <MOIS> <NOMBRE_DE_LIEUX>."
    exit
fi

echo "Top $NOMBRE_DE_LIEUX des lieux les plus cités en $MOIS/$ANNEE"
cat ~/Desktop/PPE1-2023/fichers/Fichiers/ann/$ANNEE/$MOIS/*.ann|grep "Location"|cut -f 3|sort|uniq -c|sort -n -r|head -n $NOMBRE_DE_LIEUX
