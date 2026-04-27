DF <- data.frame(length = matrix(predsAlex$Length), assim = matrix(predsAlex$assimilated_weight), meta = matrix(predsAlex$Metabolism), jd = matrix(predsAlex$JulianDay), year = matrix(predsAlex$year))


plt <- ggplot() +
#   geom_line(data = DF, aes(x = 1:length(DF$assim), y = assim)) +
#   geom_line(data = DF, aes(x = 1:length(DF$meta), y = meta), colour = "red") +
  geom_line(data = DF, aes(x = length, y = assim)) +
  geom_line(data = DF, aes(x = length, y = meta), colour = "red") +
  theme_minimal() +
  labs(x = "Julian Day", y = "Assimilated Weight (g), Metabolism (g)", title = paste0("Assimilated Weight and metabolism in ", scenario)) + 
  #scale_x_continuous(breaks = seq(1,365*28, by = 30*28)) +
  scale_x_continuous(breaks = seq(1,100, by = 5)) +
  scale_y_continuous(breaks = seq(0, 5.5, by = 0.1))

ggsave(paste0("figures/assim_v_meta/all years goldfish.png"), plot = plt, width = 18, height = 20, unit = "cm")