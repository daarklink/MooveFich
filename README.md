# MooveFich
Trier des fichiers par extensions.


mooveFich est un programme open source qui permet de trier des fichiers par leur extension, en créant des dossiers avec pour nom les différentes extensions fournies en paramètre.
/!\ Ce programme fonctionne nativement sur les systèmes Unix mais nécessite une configuration supplémentaire sur les systèmes Windows. Cette configuration est à la charge de l'utilisateur. /!\
---
Pour utiliser mooveFich :
1) Vérifier que le fichier mooveFich.sh dispose des droits d'écriture et d'exécution 
2) Déplacez-vous dans le dossier où est installé mooveFich.
3) Lancez la commande : ./mooveFich.sh .extension.
4) Indiquez le chemin d'un dossier à sauvegarder lorsque le programme le demande.
5) Un dossier mooveFich_repertoire est alors créé dans le dossier d'installation de mooveFich. Ce répertoire contient :
- Un dossier pour chaque type d'extension rencontrée.
- Un fichier history.txt accessible à tous.
---
NB :
- Le programme nécessite au moins un argument et ne limite pas le nombre d'arguments fournis.
- Le fichier history.txt retrace toutes les créations de dossiers et déplacements de fichiers, avec la date et l'heure correspondantes.
- Pour chaque type de fichiers, si le nombre total de fichiers est inférieur à 10, mooveFich les affiche. 
