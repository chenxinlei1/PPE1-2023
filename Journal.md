# Journal de bord

## 19/09/2023
## séance1

Je ne suis pas encore très à l'aise avec mon nouveau système Ubuntu. Cela me prend beaucoup de temps. Durant ce premier cours, j'ai aprris des commandes du Terminal. C'était la première fois que je l'ai fait. Tout cela m'intéresse énormément, mais il n'est pas facile de mémoriser toutes les commandes par cœur et de les utiliser sans réfléchir. 

Après avoir effectué l'exercice de création d'une arborescence de dossiers pour classer les fichiers, j'ai mieux compris ces commandes. Cependant, j'aimerais savoir comment organiser ces fichiers de manière plus rapide et plus efficace.


## 26/09/2023
## séance2

J'ai l'habitude d'utiliser Linux de plus en plus, au point que j'ouvre presque Windows. Cela me donne plus de confiance pour mes futures études.Dans ce cours, nous
révisons ensemble les commandes du Terminal. Les options telles que '--help' et '--option' sont très importantes pour nous rappeler la fonction des commandes lorsque
nous les avons oubliées. 

Dans la deuxième partie du cours, le professeur nous a présenté "Git", qui est un système de gestion de versions. Nous pouvons l'utiliser sur
GitHub pour télécharger ou déposer des documents dont nous avons besoin. Par exemple, "git clone", "git add", "git commit" etc.

## 04/10/2023
## séance3
Nous avons appris des syntaxs pour corriger des erreurs sur Github. 

1- Git reset: utilisé pour réinitialiser le référentiel Git à un commit spécifique. (git reset --soft, git reset --mixed, git reset --hard) 

2- Git revert: utilisé pour annuler les modifications apportées par un ou plusieurs commits en créant un nouveau commit qui annule les changements effectués par les commits ciblés. 

3- HEAD : représente le commit sur lequel vous êtes en train de travailler. 
<tag> : représente le commit sur lequel on a placé l’étiquette
 ̃[N] : représente l’ascendance directe de votre commit (linéaire, par défault N=1 représente le commit parent)
ˆ[N] : représente le n-ième parent du commit (non linéaire, par défault N=1 représente le commit parent)


## 11/10/2023
## séance4
Redirections vers et depuis des fichiers

- <  remplace le clavier par le contenu d’un fichier
- >  écrit stdout dans un fichier
- 2> écrit stderr dans un fichie
- >& écrit stdout et stderr dans un fichierr
En écriture, si on double le chevron (>>, >>&, 2>>), on écrit en ajoutant la sortie à la fin d’un fichier.
ATTENTION: les chevronts simples (>, >&, 2>) écrasent le fichier si il existe déjà.

Quelques commandes de plus:

grep recherche de motifs dans l’entrée (ou dans des fichiers)
sort trier des lignes
uniq supprimer les lignes qui se répètent
echo affiche un texte (pour formater vos résultats)

Dans un script bash

Par convention, au début de l’exécution d’un script, l’interpréteur donne la valeur des arguments aux variables $1 $2 $3 . . . dans l’ordre d’apparition sur la ligne de commande.
• On peut les utiliser dans notre script
(ex: faites un script qui contient uniquement la commande echo $2 et testez son comportement)
• Un bon usage est de créer de nouvelles variables avec un nom plus explicite.
example: FICHIER_URLS=$1

On donne une valeur à une variable avec le signe =
• sans espace FICHIER=urls.txt
• avec des " ou ’ si il y a des espaces
MSG="Bonjour tout le monde"
• on peut aussi stocker le resultat d’une commande en l’écrivant dans $()
ex: NB_LIGNES=$(wc -l $FICHIER)

On fait référence à la valeur d’une variable en prefixant son nom d’un $
• sera remplacé dans une chaîne entre " (doubles)
• mais pas entre ’ (simples)


## 18/10/2023
## séance5
Nous avons appris les instructions conditionnelles:

l’instruction if

if [ condition ]
then
    echo " la condition est valide "
else
    echo " la condition n’est pas valide "
fi

example:

if [[ $1 =∼ bon ( jour | soir ) ]]
then
    echo "salut"
fi

-lt (<) -le (<=) -gt (>) -ge (>=) -eq (=) -ne (!=)

Conditions possibles:

Sur les chemins

    -f fichier vrai si le fichier existe
    -d dossier vrai si le dossier existe
    -s fichier vrai si le fichier existe et n’est pas vide
Sur des chaînes de caractères

    = ou != tester si deux chaînes sont identiques (=) ou différentes (!=)
    < ou > pour déterminer si in chaîne est avant ou après une autre dans l’ordre alphabétique
    -n chaine vrai si la chaîne n’est pas vide
    -z vrai si la chaîne est vide (ex: argument non fourni)


Les boucles FOR

N =0
for ELEMENT in a b c d e
do
    N = $ ( expr $N + 1)
    echo " le $N ieme élément est $ELEMENT "
done

 la commande expr est une calculatrice

Les boucles WHILE

while [ condition ];
do
    echo " je continue à boucler " ;
done

boucle infinie: ctrl+c

Lynx

1. récupérer le contenu textuel d’une page pour l’afficher (sans navigation) → option -dump
2. retirer la liste des liens d’une page à l’affichage → option -nolist

La commande cURL


## 25/10/2023
## séance6

Nous avons choisi un mot ensemble sur le projet du group. Et après nous avons fait deux exercices: 1. lire les lignes d’un fichier en bash, 2. récupérer les métadonnées de collecte. 
Pourquoi ne pas utiliser cat ?
Il est préférable de ne pas utiliser cat pour lire un fichier ligne par ligne dans ce cas, car cat ne lit que le contenu du fichier en une seule sortie, tandis que while read -r line permet de lire chaque ligne du fichier séparément, ce qui est utile pour traiter chaque URL individuellement.

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
