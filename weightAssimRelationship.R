DFAlex <- data.frame(weights = matrix(predsAlex$Weight), assims = matrix(predsAlex$assimilated_weight), year = matrix(predsAlex$year))
DFTest <- data.frame(weights = matrix(predsTest$Weight), assims = matrix(predsTest$assimilated_weight))

plt1 <- ggplot(data = DFAlex, aes(x = weights, y = assims*0.2, colour = factor(year))) +
  geom_line() +
  labs(colour = "Year") +
  theme_minimal() +
  geom_function(fun = function(x) 0.01*x^(0.2), linetype = "dashed") 
  


ggsave(paste0("figures/weight_v_assim Alex const_all ", scenario, " .png"), plot = plt1, width = 18, height = 20, unit = "cm")

plt2 <- ggplot(data = DFTest, aes(x = weights, y = assims*0.2)) +
  geom_line() +
  theme_minimal() #+
 # geom_function(fun = function(x) 0.3*x^(0.3)-0.1*x, linetype = "dashed") 
  


ggsave(paste0("figures/weight_v_assim Test const_all scaling fh", scenario, " .png"), plot = plt2, width = 18, height = 20, unit = "cm")

# "figures/weight_v_assim Alex const_temp_light_daylength ", scenario, " .png"