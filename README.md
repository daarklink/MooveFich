# MooveFich
Permet de trier un grand nombre de fichiers par leur extension.


MooveFich est un programme open source qui permet de trier des fichiers par leur extension, en créant des dossiers avec pour nom les différentes extensions fournies en paramètre.


Ce programme fonctionne nativement sur les systèmes Unix et tout système disposant d’un interpréteur Bash (ou d’un shell compatible POSIX), comme macOS. 


⚠ Sur Windows, une configuration supplémentaire est nécessaire (voir section installation).
---

## Installation

### Unix
####

Sur les systèmes basés sur Unix (GNU/Linux, macOS, BSD, etc.), le programme fonctionne directement si un shell compatible Bash est disponible.

Exécuter `bash --version` pour vérifier si Bash est bien installé.

####

- Décompresser le fichier zip
- Depuis le terminal, naviguer jusqu'à *mooveFich.sh*
- Exécuter **au minimum** `chmod 700 moovefich.sh` (ou simplement `chmod +x mooveFich`)

### Windows

- Installer et configurer WSL2 si ce n'est pas déjà fait [lien vers le tutoriel de lecrabeinfo](https://lecrabeinfo.net/tutoriels/installer-wsl-windows-subsystem-for-linux-sur-windows-10/)
- Ouvrir un terminal WSL
- Exécuter `cd /mnt/c/Users/<NOM_UTILISATEUR_WINDOWS>/<CHEMIN_VERS_DOSSIER_INSTALLATION_MooveFich>/mooveFich.sh`
- Exécuter **au minimum** `chmod 700 moovefich.sh` (ou simplement `chmod +x mooveFich`)



## Pour utiliser mooveFich :
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
