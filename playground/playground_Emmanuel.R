library(tidyverse)

########################################
#### Read in Data
########################################

d.covid <- read.csv("data/COVID/data.csv", header = TRUE)
str(d.covid)

d.consumption <- read.csv("data/MonitoringConsumptionSwitzerland/ACQ_POS_Grossregion_NOGA.csv", header = TRUE)
str(d.consumption)

########################################
#### Convert days to ISO week
########################################

## are all temporal observations in d.covid recorded in iso_weeks? YES
unique(d.covid$temporal_type)

## add column iso_week to d.consumption
d.consumption.isoWeeks <- d.consumption %>% 
  mutate(
    Date = as.Date(Date),
    iso_year = isoyear(Date),
    iso_week = isoweek(Date),
    iso_year_week = paste0(iso_year, "-W", str_pad(iso_week, width = 2, pad = "0"))
  )
unique(d.consumption.isoWeeks$iso_year_week)







