#!/usr/bin/bash

#écrire un script qui donne le nombre de Location par année

echo "Nombre de locations pour l'année 2016 :"
cat ~/Desktop/PPE1-2023/fichers/Fichiers/ann/2016/*/*.ann|grep "Location"|cut -f 3|sort|uniq -c|wc -l
echo "Nombre de locations pour l'année 2017 :"
cat ~/Desktop/PPE1-2023/fichers/Fichiers/ann/2017/*/*.ann|grep "Location"|cut -f 3|sort|uniq -c|wc -l
echo "Nombre de locations pour l'année 2018 :"
cat ~/Desktop/PPE1-2023/fichers/Fichiers/ann/2018/*/*.ann|grep "Location"|cut -f 3|sort|uniq -c|wc -l