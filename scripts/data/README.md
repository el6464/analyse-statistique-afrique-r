# Données

Les données utilisées dans ce projet proviennent des World Development Indicators de la Banque mondiale.

Le fichier `donnees_afrique.csv` est généré automatiquement par le script :

`scripts/01_import_preparation.R`

## Variables principales

| Variable | Description |
|---|---|
| `country` | Pays |
| `year` | Année |
| `rnb_habitant` | RNB par habitant |
| `esperance_vie` | Espérance de vie à la naissance |
| `fecondite` | Nombre d'enfants par femme |

Les données sont récupérées directement depuis la source afin de permettre la reproduction de l'analyse.
