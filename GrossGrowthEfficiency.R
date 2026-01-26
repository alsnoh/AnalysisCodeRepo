

#################### Gross Growth Efficiency Calculation #############################################

GGE <- function(preds) {

  GGE <- c()
  yearsV <- c()
  daysV <- c()  

  years <- unique(preds$year)

  for (iyear in years) {
    weight <- preds[preds$year == iyear]
    jd <- preds$JulianDay[preds$year == iyear]

    end <- nrow(weight)

    diff1 <- weight$Weight[2:end] - weight$Weight[1:end-1]
    diff2 <- weight$ingested_energy[1:end-1]



    quotient <- diff1/diff2

    GGE <- c(GGE, quotient)
    yearsV <- c(yearsV, rep(iyear, length(quotient)))
    daysV <- c(daysV, jd[1:end-1] )

  }


GGE1 <- data.frame(years = matrix(yearsV), GGE = matrix(GGE), day = matrix(daysV))
names(GGE1)[1] <- "years"
names(GGE1)[2] <- "GGE"
names(GGE1)[3] <- "day"

return(GGE1)
}


AgnesGGE <- GGE(predsAgnes)
AlexGGE <- GGE(predsAlex)

plt1 <- ggplot(data = AgnesGGE, aes(x = day, y = GGE, colour = factor(years))) +
  geom_line() +
  labs(colour = "Year") +
  theme_minimal()

plt2 <- ggplot(data = AlexGGE, aes(x = day, y = GGE, colour = factor(years))) +
  geom_line() +
  labs(colour = "Year") +
  theme_minimal()

  
ggsave(paste0("figures/AgnesGGE ", scenario, " .png"), plot = plt1, width = 18, height = 20, unit = "cm")
ggsave(paste0("figures/AlexGGE ", scenario, " .png"), plot = plt2, width = 18, height = 20, unit = "cm")