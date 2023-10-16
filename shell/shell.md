- Compter le nombre d’annotations par année (2016, 2017 et 2018)
wc: word count
-l: les lignes de texte
cat ./2016/*/* | wc -l
9442
cat ./2017/*/* | wc -l
7179
cat ./2018/*/* | wc -l
7561

- limiter ce comptage aux lieux (Location)
cat ./2016/*/* | grep Location | wc -l
3144
cat ./2017/*/* | grep Location | wc -l
2466
cat ./2018/*/* | grep Location | wc -l
3110

- sauvegarder ces résultats dans un (seul) fichier,
cat ./2016/*/* | grep Location | wc -l > reponses.txt
cat ./2017/*/* | grep Location | wc -l >> reponses.txt
cat ./2018/*/* | grep Location | wc -l >> reponses.txt
cat reponses.txt
3144
2466
3110


- établir le classement des lieux les plus cités.
cat ./2016/*/* | grep Location | cut -f 3 | head -n 15 | sort | uniq -c | sort -nr
4 Afrique de l'Ouest
3 Guinée
2 Valence
1 Sierra Leone
1 Savoie
1 Libéria
1 France
1 Drôme
1 Bron
cat ./2017/*/* | grep Location | cut -f 3 | head -n 15 | sort | uniq -c | sort -nr
cat ./2018/*/* | grep Location | cut -f 3 | head -n 15 | sort | uniq -c | sort -nr

cut -f 3: Cette commande est utilisée pour extraire le champ numéro 3 de chaque ligne. 
uniq -c : Cette commande uniq est utilisée pour supprimer les lignes en double (doublons), et l'option -c est utilisée pour compter le nombre d'occurrences de chaque ligne unique.

- trouver les annotations les plus fréquentes pour votre mois de naissance, toutes années confondues.
cat ./*/*/* | grep avril | cut -f 3 | sort | uniq -c | sort -nr
8 16 avril 2017
7 2 avril 2017
7 19 avril 2017
6 avril 2015
5 avril 2017
...


