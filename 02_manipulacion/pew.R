library(foreign)
library(stringr)
library(rformat)
library(plyr)
library(dplyr)
library(tidyr)
library(xtable)

# Data from http://pewforum.org/Datasets/Dataset-Download.aspx
# codigo y datos tomados y adaptados de 
## https://github.com/hadley/tidy-data/blob/master/data/pew.r

################################################################################
# Cargamos los datos

pew <- read.spss("tidyr_datasets/pew.sav")
pew <- as.data.frame(pew)

################################################################################
# Primero, extraemos las columnas que tienen que ver con religion e ingreso
## Declaramos las clases y niveles de los factores
religion <- pew[c("q16", "reltrad", "income")]
religion$reltrad <- as.character(religion$reltrad)
religion$reltrad <- str_replace(religion$reltrad, " Churches", "")
religion$reltrad <- str_replace(religion$reltrad, " Protestant", " Prot")
religion$reltrad[religion$q16 == " Atheist (do not believe in God) "] <- "Atheist"
religion$reltrad[religion$q16 == " Agnostic (not sure if there is a God) "] <- "Agnostic"
religion$reltrad <- str_trim(religion$reltrad)
religion$reltrad <- str_replace_all(religion$reltrad, " \\(.*?\\)", "")

religion$income <- c("Less than $10,000" = "<$10k", 
                     "10 to under $20,000" = "$10-20k", 
                     "20 to under $30,000" = "$20-30k", 
                     "30 to under $40,000" = "$30-40k", 
                     "40 to under $50,000" = "$40-50k", 
                     "50 to under $75,000" = "$50-75k",
                     "75 to under $100,000" = "$75-100k", 
                     "100 to under $150,000" = "$100-150k", 
                     "$150,000 or more" = ">150k", 
                     "Don't know/Refused (VOL)" = "Don't know/refused")[religion$income]

religion$income <- factor(religion$income, levels = c("<$10k", "$10-20k", "$20-30k", "$30-40k", "$40-50k", "$50-75k", 
                                                      "$75-100k", "$100-150k", ">150k", "Don't know/refused"))


## Agregamos los datos segun reltrad e income
# Forma 1> plyr
counts <- plyr::count(religion, c("reltrad", "income"))
names(counts)[1] <- "religion"

# Forma 2> dplyr
counts2 <- dplyr::group_by(religion, reltrad, income) %>%
  dplyr::summarise(freq = n()) %>%
  dplyr::rename(religion = reltrad) %>% data.frame()

#counts$income <- as.character(counts$income)
# Ejemplificacion tipo el paper-

raw <- tidyr::spread(counts, key = income, value = freq)



