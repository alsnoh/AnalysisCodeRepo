#Run analysis scripts from here

suppressMessages(library(ggplot2))
suppressMessages(library(ggpubr))
suppressMessages(library(lubridate))
suppressMessages(library(tidyverse))
suppressMessages(library(readr))
suppressMessages(library(data.table))
suppressMessages(library(dplyr))



# clear environment
rm(list = ls())

scenario = "ECG"

source("loadData.R")

# plot lengths at specific julian day, FoF is 182, rest are 212 (overwintering)
#source("plotLengths_jd.R")
#plotLengths_jd(212)

source("GrossGrowthEfficiency.R")
#source("weightLengthRelationship.R")