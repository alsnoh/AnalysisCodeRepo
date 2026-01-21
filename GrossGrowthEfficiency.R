predLengthsAgnes <- predLengthsAgnes[predLengthsAgnes$year == 1982]

end <- nrow(predLengthsAgnes)

diff1 <- predLengthsAgnes$Length[2:end] - predLengthsAgnes$Length[1:end-1]
diff2 <- predLengthsAgnes$ingested_energy[1:end-1]



quotient <- diff1/diff2

AgnesGGE <- data.frame(GGE = quotient)

plt <- ggplot() +
  geom_point(data = AgnesGGE, aes(x = seq(1, end-1, 1), y = GGE), colour = "goldenrod2")

  
ggsave(paste0("figures/AgnesGGE ", scenario, " .png"), plot = plt, width = 18, height = 20, unit = "cm")