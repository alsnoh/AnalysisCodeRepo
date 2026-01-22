
years <- unique(predLengthsAgnes$year)

AgnesGGE <- data.frame()
years_vec <- data.frame()
x_seq <- data.frame()

for (iyear in years) {
  weight <- predLengthsAgnes[predLengthsAgnes$year == iyear]

  end <- nrow(weight)

  diff1 <- weight$Weight[2:end] - weight$Weight[1:end-1]
  diff2 <- weight$ingested_energy[1:end-1]



  quotient <- diff1/diff2

  AgnesGGE <- rbind(AgnesGGE, matrix(quotient))
  years_vec <- rbind(years_vec, matrix(rep(iyear, length(quotient))))
  x_seq <- rbind(x_seq, matrix(seq(1, length(quotient), 1)))

}

AgnesGGE <- data.frame(years = years_vec, GGE = AgnesGGE, day = x_seq)
names(AgnesGGE)[1] <- "years"
names(AgnesGGE)[2] <- "GGE"
names(AgnesGGE)[3] <- "day"


plt <- ggplot(data = AgnesGGE, aes(x = day, y = GGE, colour = factor(years))) +
  geom_line() +
  labs(colour = "Year") +
  theme_minimal()

  
 ggsave(paste0("figures/AgnesGGE ", scenario, " .png"), plot = plt, width = 18, height = 20, unit = "cm")