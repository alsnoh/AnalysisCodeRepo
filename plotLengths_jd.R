

colours <- c("goldenrod2", "#a04e2b", "steelblue3", "darkorchid4")

plotLengths_jd <- function(jd) {
  # Consider just year and length data (cm)
  lengths <- data.frame(year = lengths$year, length = lengths$length)

  # Consider just year and length data (cm)
  lengthsAgnes <- data.frame(year = predsAgnes$year, length = predsAgnes$Length, jd = predsAgnes$JulianDay, ingestion = predsAgnes$assimilated_weight)
  lengthsAlex <- data.frame(year = predsAlex$year, length = predsAlex$Length, jd = predsAlex$JulianDay, ingestion = predsAlex$assimilated_weight)

  # Predicted lengths at jd-182 (1 July)
  lengthsAgnes <- lengthsAgnes[lengthsAgnes$jd == jd,]
  lengthsAlex <- lengthsAlex[lengthsAlex$jd == jd,]

  if (min(lengthsAlex$year) < min(lengths$year)) {
    from <- min(lengths$year)
  } else {
    from <- min(lengthsAlex$year)
  }
  if (max(lengthsAlex$year) > max(lengths$year)) {
    to <- max(lengths$year)
  } else {
    to <- max(lengthsAlex$year)
  }

  lm <- lm(length ~ year, data = lengthsAlex[lengthsAlex$year >= from & lengthsAlex$year <= to, ])
  lm1 <- lm(length ~ year, data = lengths[lengths$year >= from & lengths$year <= to, ])

    plt <- ggplot() +
    ggtitle(scenario) +
    #geom_point(data = lengthsAgnes, aes(x = year, y = length), colour = "goldenrod2") +
    #geom_line(data = lengthsAgnes, aes(x = year, y = length), colour = "goldenrod2") +
    geom_point(data = lengths, aes(x = year, y = length), colour = colours[which(scenarios == scenario)], shape = 1, size = 4) +
    geom_line(data = lengths, aes(x = year, y = length), colour = colours[which(scenarios == scenario)], linetype = "dashed") +
    geom_point(data = lengthsAlex, aes(x = year, y = length), colour = colours[which(scenarios == scenario)]) +
    geom_line(data = lengthsAlex, aes(x = year, y = length), colour = colours[which(scenarios == scenario)]) + 
    geom_abline(intercept = lm$coefficients[1], slope = lm$coefficients[2], colour = colours[which(scenarios == scenario)], linetype = "solid", linewidth = 1) +
    geom_abline(intercept = lm1$coefficients[1], slope = lm1$coefficients[2], colour = colours[which(scenarios == scenario)], linetype = "dashed", linewidth = 1) +
    labs(x = "year", y = " length (cm)") +
    theme_classic(base_size = 15) +
    theme(text = element_text(size = 30),
                  legend.position = "bottom",
          legend.margin = margin(c(1,1,1,1)))+#, + panel.grid = element_line(color = "#8ccde3", size = 0.75,linetype = 2))   
    scale_x_continuous(breaks = seq(1973, 2017, by = 4))

    #ggsave(paste0("figures/length_compare/jd ",jd, " ", scenario, " V6 test.png"), plot = plt, width = 18, height = 20, unit = "cm")
    return(plt)
}

