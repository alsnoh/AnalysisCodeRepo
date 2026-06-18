#Run analysis scripts from here

suppressMessages(library(ggplot2))
suppressMessages(library(ggpubr))
suppressMessages(library(lubridate))
suppressMessages(library(tidyverse))
suppressMessages(library(readr))
suppressMessages(library(data.table))
suppressMessages(library(dplyr))
suppressMessages(library(ggeffects))
suppressMessages(library(plotly))
library(gridExtra)
library(grid)
library(htmlwidgets)



# clear environment
rm(list = ls())


# pick location "FoF", "DB", "Shetland", "ECG"
scenarios <- c("ECG")#, "DB", "Shetland", "ECG")
scenario <- scenarios[1]
fish <- "herring"
jds <- c(300,212,212,212)#c(182, 212, 182, 212)

source("plotLengths_jd.R")
plts <- list()
for (scenario in scenarios) 
{

    source("loadData.R")
    plt <- plotLengths_jd(jds[which(scenarios == scenario)])
    l1 <- list(plt)
    plts <- c(l1, plts)
}


# plot lengths at specific julian day, FoF is 182, rest are 212 (overwintering)

# source("loadData.R")
# source("yearlyWeight.R")
# source("assim_v_meta.R")
#source("GrossGrowthEfficiency.R")
#source("weightLengthRelationship.R")
#source("weightAssimRelationship.R")
#source("filterParticulate.R")
source("saveFigures.R")