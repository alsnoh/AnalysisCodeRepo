predLengthsAgnes <- predLengthsAgnes[predLengthsAgnes$jd == 182,]
predLengths <- predLengths[predLengths$jd == 182,]


plt <- ggplot() +
  geom_point(data = predLengthsAgnes, aes(x = year, y = length), colour = "goldenrod2") +
  geom_line(data = predLengthsAgnes, aes(x = year, y = length), colour = "goldenrod2") +
  geom_point(data = lengths, aes(x = year, y = length), colour = "#a04e2b") +
  geom_line(data = lengths, aes(x = year, y = length), colour = "#a04e2b") +
  geom_point(data = predLengths, aes(x = year, y = length)) +
  geom_line(data = predLengths, aes(x = year, y = length)) +
  labs(x = "year", y = "Predicted length (cm)") +
  theme_classic(base_size = 15) +
  theme(legend.position = "bottom",
        legend.margin = margin(c(1,1,1,1)),
        panel.grid = element_line(color = "#8ccde3",
                                  size = 0.75,
                                  linetype = 2)) +
  scale_x_continuous(breaks = seq(1973, 2016, by = 4))

  ggsave("figures/length_compare_jd-182.png", plot = plt, width = 18, height = 20, unit = "cm")