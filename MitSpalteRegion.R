# Pakete laden
library(dplyr)
library(readr)


# CSV-Datei einlesen
df <- read_csv("/Users/tanjasidler/switchdrive/RBootcamp/data.csv")

# Hinzufügen der neuen Spalte geo_largeregion mit bedingten Werten
df <- df %>%
  mutate("Region" = case_when(
    georegion %in% c("GE", "VS", "VD") ~ "Lake Geneva",
    georegion %in% c("JU", "BE", "FR", "SO", "NE") ~ "Espace Mittelland",
    georegion %in% c("AG", "BS", "BL") ~ "Northwestern",
    georegion %in% c("SZ", "OW", "NW", "LU", "ZG", "UR") ~ "Central",
    georegion %in% c("TI") ~ "Ticino",
    georegion %in% c("ZH") ~ "Zurich",
    georegion %in% c("SG", "GR", "SH", "TG", "GL", "AI", "AR") ~ "Eastern",
    TRUE ~ "unknown" # Für alle anderen Fälle
  ))

col_order <- c(names(df)[1:which(names(df) == "georegion_type")], 
               "Region", 
               names(df)[(which(names(df) == "georegion_type")+1):(ncol(df)-1)])
df <- df[, col_order]

# Überprüfen der ersten paar Zeilen der aktualisierten Daten
head(df)

# Aktualisierte Datei speichern
write_csv(df, "/Users/tanjasidler/switchdrive/RBootcamp/newdata_data.csv")
