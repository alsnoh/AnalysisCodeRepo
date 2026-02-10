DFAlex <- data.frame(weights = matrix(predsAlex$Weight), assims = matrix(predsAlex$assimilated_weight), year = matrix(predsAlex$year))


plt1 <- ggplot(data = DFAlex, aes(x = weights, y = assims, colour = factor(year))) +
  geom_line() +
  labs(colour = "Year") +
  theme_minimal() +
  geom_function(fun = function(x) 0.3*x^(3/4)-0.2*x, linetype = "dashed") 
  #geom_function(fun = function(x) 0.1*x^(23/10)/(1+x^(23/10)), linetype = "dashed") 


ggsave(paste0("figures/weight_v_assim Alex const_all ", scenario, " .png"), plot = plt1, width = 18, height = 20, unit = "cm")

# "figures/weight_v_assim Alex const_temp_light_daylength ", scenario, " .png"