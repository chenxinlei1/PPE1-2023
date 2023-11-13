#!/bin/bash



ENTITE=$1


if [ $# -ne 1 ]
then
    echo "Ce script a besoin d'un argument: <ENTITE>."
    exit
fi

for ANNEE in 2016 2017 2018
do
     bash un_script.sh $1 $ANNEE
done
