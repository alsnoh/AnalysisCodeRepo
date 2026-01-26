
plotLengths_jd <- function(jd) {
  # Consider just year and length data (cm)
  lengths <- data.frame(year = lengths$year, length = lengths$length)

  # Consider just year and length data (cm)
  lengthsAgnes <- data.frame(year = predsAgnes$year, length = predsAgnes$Length, jd = predsAgnes$JulianDay, ingestion = predsAgnes$ingested_energy)
  lengthsAlex <- data.frame(year = predsAlex$year, length = predsAlex$Length, jd = predsAlex$JulianDay, ingestion = predsAlex$assimilated_energy)

  # Predicted lengths at jd-182 (1 July)
  lengthsAgnes <- lengthsAgnes[lengthsAgnes$jd == jd,]
  lengthsAlex <- lengthsAlex[lengthsAlex$jd == jd,]


  plt <- ggplot() +
    geom_point(data = lengthsAgnes, aes(x = year, y = length), colour = "goldenrod2") +
    geom_line(data = lengthsAgnes, aes(x = year, y = length), colour = "goldenrod2") +
    geom_point(data = lengths, aes(x = year, y = length), colour = "#a04e2b") +
    geom_line(data = lengths, aes(x = year, y = length), colour = "#a04e2b") +
    geom_point(data = lengthsAlex, aes(x = year, y = length)) +
    geom_line(data = lengthsAlex, aes(x = year, y = length)) +
    labs(x = "year", y = " length (cm)") +
    theme_classic(base_size = 15) +
    theme(legend.position = "bottom",
          legend.margin = margin(c(1,1,1,1)),
          panel.grid = element_line(color = "#8ccde3",
                                    size = 0.75,
                                    linetype = 2)) +
    scale_x_continuous(breaks = seq(1973, 2016, by = 4))

    ggsave(paste0("figures/length_compare_jd ",jd, " ", scenario, " weightTest.png"), plot = plt, width = 18, height = 20, unit = "cm")

}

