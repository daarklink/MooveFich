#!/bin/bash

# Obtenir la date et l'heure actuelles
date=$(date "+%Y-%m-%d %H:%M:%S")

# Vérification du nombre d'arguments
if [ $# -lt 1 ]; then
    echo "Erreur : le script prend au moins 1 argument"
    exit 1
fi

# Création du répertoire mooveFich_repertoire
repertoire="mooveFich_repertoire"
if [ -d "$repertoire" ]; then
    echo "Un répertoire de sauvegarde mooveFich existe déjà, les nouvelles sauvegardes seront placées dans ce répertoire."
else
    mkdir "$repertoire"
fi

# Vérification du fichier mooveFich_repertoire/history.txt
fichier="mooveFich_repertoire/history.txt"
if [ -f "$fichier" ]; then
    echo "Le fichier history.txt existe, il va être complété."
else
    touch "$fichier"
fi

# Lecture du chemin du répertoire à sauvegarder
read -p "Entrez le chemin d'un répertoire à sauvegarder : " chemin
if [ ! -d "$chemin" ]; then
    echo "Erreur : Le chemin spécifié n'est pas un répertoire valide."
    exit 1
fi

# Déplacement des fichiers et création des dossiers de tri
echo "Le programme va déplacer les fichiers qui contiennent les extensions suivantes :"
for arg in "$@"
do
    # Trouver les fichiers avec l'extension spécifiée
    files=$(find "$chemin" -type f -name "*$arg")

    # Vérifier si des fichiers existent
    if [ -n "$files" ]; then
        echo "Extension : $arg"
        # Compter le nombre de fichiers dans $files
        nb_files=$(echo "$files" | wc -l)
        echo "Nombre de fichiers trouvés : $nb_files"
        if [ "$nb_files" -le 10 ]; then
            echo "$files"
        fi

        # Créer un dossier pour l'extension s'il n'existe pas
        dossier_ext="$repertoire/${arg#.}"
        if [ ! -d "$dossier_ext" ]; then
            mkdir "$dossier_ext"
            echo "create directory : $dossier_ext at $date" >> $fichier
        fi

        # Déplacer les fichiers vers le dossier créé
        while IFS= read -r file; do
            # Récupérer la taille du fichier
            taille=$(du -b "$file" | cut -f1)
    
            # Déplacer le fichier
            mv "$file" "$dossier_ext/"
    
            # Afficher les informations
            echo "moove file: $file ($taille bytes) to $dossier_ext at $date" >> $fichier
            done <<< "$files"

    else
        echo "Aucun fichier trouvé pour l'extension : $arg"
    fi
done

#affichage du chemin de sauvegarde
chemin_absolu=$(realpath "$repertoire")
echo "Le chemin du répertoire de sauvegarde est : $chemin_absolu"
echo "" >> $fichier

exit 0
