# ============================================================
# 01 - IMPORTATION ET PREPARATION DES DONNEES
# Analyse statistique des indicateurs socio-economiques en Afrique
# ============================================================

# Installation des packages si nécessaire
packages <- c(
  "WDI",
  "dplyr",
  "tidyr",
  "readr",
  "countrycode"
)

packages_manquants <- packages[
  !(packages %in% installed.packages()[, "Package"])
]

if (length(packages_manquants) > 0) {
  install.packages(packages_manquants)
}

# Chargement des packages
library(WDI)
library(dplyr)
library(tidyr)
library(readr)
library(countrycode)

# ------------------------------------------------------------
# 1. Paramètres
# ------------------------------------------------------------

annee_debut <- 2000
annee_fin <- 2023

# Indicateurs Banque mondiale
indicateurs <- c(
  rnb_habitant = "NY.GNP.PCAP.CD",
  esperance_vie = "SP.DYN.LE00.IN",
  fecondite = "SP.DYN.TFRT.IN"
)

# ------------------------------------------------------------
# 2. Importation
# ------------------------------------------------------------

donnees_brutes <- WDI(
  country = "all",
  indicator = indicateurs,
  start = annee_debut,
  end = annee_fin,
  extra = TRUE
)

# ------------------------------------------------------------
# 3. Identification des pays africains
# ------------------------------------------------------------

donnees_afrique <- donnees_brutes %>%
  mutate(
    continent = countrycode(
      iso2c,
      origin = "iso2c",
      destination = "continent"
    )
  ) %>%
  filter(continent == "Africa")

# ------------------------------------------------------------
# 4. Sélection des variables
# ------------------------------------------------------------

donnees_afrique <- donnees_afrique %>%
  select(
    iso2c,
    country,
    year,
    rnb_habitant,
    esperance_vie,
    fecondite
  ) %>%
  arrange(country, year)

# ------------------------------------------------------------
# 5. Suppression des lignes totalement vides
# ------------------------------------------------------------

donnees_afrique <- donnees_afrique %>%
  filter(
    !(is.na(rnb_habitant) &
        is.na(esperance_vie) &
        is.na(fecondite))
  )

# ------------------------------------------------------------
# 6. Vérification
# ------------------------------------------------------------

print(head(donnees_afrique))

print(summary(donnees_afrique))

cat(
  "Nombre de pays :",
  n_distinct(donnees_afrique$country),
  "\n"
)

cat(
  "Nombre d'observations :",
  nrow(donnees_afrique),
  "\n"
)

# ------------------------------------------------------------
# 7. Export
# ------------------------------------------------------------

dir.create("data", showWarnings = FALSE)

write_csv(
  donnees_afrique,
  "data/donnees_afrique.csv"
)

cat("Données sauvegardées dans data/donnees_afrique.csv\n")
