

#################### Gross Growth Efficiency Calculation #############################################

GGE <- function(preds) {

  GGE <- c()
  yearsV <- c()
  daysV <- c()
  ingestedWeight <- c()  

  years <- unique(preds$year)

  for (iyear in years) {
    weight <- preds[preds$year == iyear]
    jd <- preds$JulianDay[preds$year == iyear]

    end <- nrow(weight)

    diff1 <- weight$Weight[2:end] - weight$Weight[1:end-1]
    diff2 <- weight$ingested_weight[1:end-1]



    quotient <- diff1/diff2

    GGE <- c(GGE, quotient)
    yearsV <- c(yearsV, rep(iyear, length(quotient)))
    daysV <- c(daysV, jd[1:end-1] )
    ingestedWeight <- c(ingestedWeight, diff2)

  }


GGE1 <- data.frame(years = matrix(yearsV), GGE = matrix(GGE), day = matrix(daysV), ingestedWeight = matrix(ingestedWeight))
names(GGE1)[1] <- "years"
names(GGE1)[2] <- "GGE"
names(GGE1)[3] <- "day"
names(GGE1)[4] <- "ingestedWeight"
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
  scale_y_continuous(breaks = seq(0, 1, by = 0.1)) +
  coord_cartesian(ylim = c(0, 1)) +
  theme_minimal()

  
ggsave(paste0("figures/GGE/Agnes ", scenario, " .png"), plot = plt1, width = 18, height = 20, unit = "cm")
ggsave(paste0("figures/GGE/Alex ", scenario, " .png"), plot = plt2, width = 18, height = 20, unit = "cm")