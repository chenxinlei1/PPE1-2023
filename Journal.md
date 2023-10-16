#Journal de bord

##19/09/2023
##séance1

Je ne suis pas encore très à l'aise avec mon nouveau système Ubuntu. Cela me prend beaucoup de temps. Durant ce premier cours, j'ai aprris des commandes du Terminal. C'était la première fois que je l'ai fait. Tout cela m'intéresse énormément, mais il n'est pas facile de mémoriser toutes les commandes par cœur et de les utiliser sans réfléchir. 

Après avoir effectué l'exercice de création d'une arborescence de dossiers pour classer les fichiers, j'ai mieux compris ces commandes. Cependant, j'aimerais savoir comment organiser ces fichiers de manière plus rapide et plus efficace.


##26/09/2023
##séance2

J'ai l'habitude d'utiliser Linux de plus en plus, au point que j'ouvre presque Windows. Cela me donne plus de confiance pour mes futures études.Dans ce cours, nous
révisons ensemble les commandes du Terminal. Les options telles que '--help' et '--option' sont très importantes pour nous rappeler la fonction des commandes lorsque
nous les avons oubliées. 

Dans la deuxième partie du cours, le professeur nous a présenté "Git", qui est un système de gestion de versions. Nous pouvons l'utiliser sur
GitHub pour télécharger ou déposer des documents dont nous avons besoin. Par exemple, "git clone", "git add", "git commit" etc.

##04/10/2023
##séance3
Nous avons appris des syntaxs pour corriger des erreurs sur Github. 

1- Git reset: utilisé pour réinitialiser le référentiel Git à un commit spécifique. (git reset --soft, git reset --mixed, git reset --hard) 

2- Git revert: utilisé pour annuler les modifications apportées par un ou plusieurs commits en créant un nouveau commit qui annule les changements effectués par les commits ciblés. 

3- HEAD : représente le commit sur lequel vous êtes en train de travailler. 
<tag> : représente le commit sur lequel on a placé l’étiquette
 ̃[N] : représente l’ascendance directe de votre commit (linéaire, par défault N=1 représente le commit parent)
ˆ[N] : représente le n-ième parent du commit (non linéaire, par défault N=1 représente le commit parent)


##11/10/2023
##séance4
Redirections vers et depuis des fichiers
- < remplace le clavier par le contenu d’un fichier
- > écrit stdout dans un fichier
- 2> écrit stderr dans un fichie
- >& écrit stdout et stderr dans un fichierr
En écriture, si on double le chevron (>>, >>&, 2>>), on écrit en ajoutant la sortie à la fin d’un fichier.
ATTENTION: les chevronts simples (>, >&, 2>) écrasent le fichier si il existe déjà.

Quelques commandes de plus
grep recherche de motifs dans l’entrée (ou dans des fichiers)
sort trier des lignes
uniq supprimer les lignes qui se répètent
echo affiche un texte (pour formater vos résultats)

Dans un script bash
Par convention, au début de l’exécution d’un script, l’interpréteur donne la valeur des arguments aux variables $1 $2 $3 . . .
dans l’ordre d’apparition sur la ligne de commande.
• On peut les utiliser dans notre script
(ex: faites un script qui contient uniquement la commande echo $2 et testez son comportement)
• Un bon usage est de créer de nouvelles variables avec un nom plus explicite.
example: FICHIER_URLS=$1

Affectation
On donne une valeur à une variable avec le signe =
• sans espace FICHIER=urls.txt
• avec des " ou ’ si il y a des espaces
MSG="Bonjour tout le monde"
• on peut aussi stocker le resultat d’une commande en l’écrivant dans $()
ex: NB_LIGNES=$(wc -l $FICHIER)

Utilisation
On fait référence à la valeur d’une variable en prefixant son nom d’un $
• sera remplacé dans une chaîne entre " (doubles)
• mais pas entre ’ (simples)