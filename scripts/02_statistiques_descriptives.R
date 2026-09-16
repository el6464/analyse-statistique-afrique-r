# ============================================================
# 02 - STATISTIQUES DESCRIPTIVES
# Analyse statistique des indicateurs socio-economiques en Afrique
# ============================================================

library(dplyr)
library(tidyr)
library(readr)

# ------------------------------------------------------------
# 1. Importation des données
# ------------------------------------------------------------

donnees <- read_csv(
  "data/donnees_afrique.csv",
  show_col_types = FALSE
)

# ------------------------------------------------------------
# 2. Mise au format long
# ------------------------------------------------------------

donnees_longues <- donnees %>%
  pivot_longer(
    cols = c(
      rnb_habitant,
      esperance_vie,
      fecondite
    ),
    names_to = "indicateur",
    values_to = "valeur"
  )

# ------------------------------------------------------------
# 3. Statistiques descriptives
# ------------------------------------------------------------

statistiques <- donnees_longues %>%
  group_by(indicateur) %>%
  summarise(
    observations = sum(!is.na(valeur)),
    moyenne = mean(valeur, na.rm = TRUE),
    mediane = median(valeur, na.rm = TRUE),
    ecart_type = sd(valeur, na.rm = TRUE),
    minimum = min(valeur, na.rm = TRUE),
    Q1 = quantile(valeur, 0.25, na.rm = TRUE),
    Q3 = quantile(valeur, 0.75, na.rm = TRUE),
    maximum = max(valeur, na.rm = TRUE),
    .groups = "drop"
  )

# ------------------------------------------------------------
# 4. Affichage
# ------------------------------------------------------------

print(statistiques)

# ------------------------------------------------------------
# 5. Export du tableau
# ------------------------------------------------------------

dir.create("outputs/tables", recursive = TRUE, showWarnings = FALSE)

write_csv(
  statistiques,
  "outputs/tables/statistiques_descriptives.csv"
)

cat("Tableau enregistré dans outputs/tables/\n")
