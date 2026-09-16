# Analyse statistique des inégalités socio-économiques en Afrique

## Présentation

Ce projet porte sur l'analyse statistique d'indicateurs socio-économiques et démographiques de pays africains.

L'objectif est d'explorer les relations entre les conditions économiques, la santé et la dynamique démographique à partir de données publiques.

L'analyse est réalisée avec R et combine préparation des données, statistiques descriptives, détection des valeurs atypiques, analyse des corrélations et visualisation.

## Problématique

Dans quelle mesure les indicateurs économiques et démographiques sont-ils associés aux différences observées entre les pays africains ?

## Données

Les données utilisées proviennent de la Banque mondiale (World Development Indicators).

Les principaux indicateurs étudiés sont :

- RNB par habitant ;
- espérance de vie à la naissance ;
- taux de fécondité ;
- pays africains ;
- évolution sur plusieurs années.

Les données sont récupérées directement à partir de l'API de la Banque mondiale afin de rendre l'analyse reproductible.

## Méthodologie

Le projet suit plusieurs étapes :

1. Importation des données
2. Sélection des pays africains
3. Nettoyage et préparation
4. Analyse descriptive
5. Analyse des distributions
6. Détection des valeurs atypiques
7. Analyse des corrélations
8. Visualisation des relations entre variables
9. Analyse de l'évolution temporelle
10. Interprétation des résultats

## Analyses statistiques

Les analyses comprennent notamment :

- moyenne ;
- médiane ;
- variance ;
- écart-type ;
- quartiles ;
- minimum et maximum ;
- valeurs atypiques ;
- matrices de corrélation ;
- nuages de points ;
- distributions ;
- comparaisons entre pays.

## Visualisation

Les graphiques sont réalisés avec `ggplot2`.

Les principales visualisations permettent d'étudier :

- la distribution du RNB par habitant ;
- la distribution de l'espérance de vie ;
- la distribution de la fécondité ;
- la relation entre RNB et espérance de vie ;
- la relation entre fécondité et espérance de vie ;
- l'évolution des indicateurs dans le temps.

## Outils

- R
- dplyr
- ggplot2
- tidyr
- readr
- WDI
- countrycode
- scales

## Limites

Les corrélations observées décrivent des associations entre variables. Elles ne permettent pas, à elles seules, d'établir une relation de causalité.

Les différences entre pays peuvent également être liées à d'autres facteurs économiques, sociaux, démographiques ou institutionnels qui ne sont pas intégrés dans cette analyse.

## À propos

Projet réalisé dans une démarche d'analyse statistique et de data visualisation, en continuité avec un travail universitaire de Data Mining consacré à l'exploration de données africaines.
