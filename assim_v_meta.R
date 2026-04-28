DF <- data.frame(length = matrix(predsAlex$Length), assim = matrix(predsAlex$assimilated_weight), meta = matrix(predsAlex$Metabolism), jd = matrix(predsAlex$JulianDay), year = matrix(predsAlex$year))

filter <- 102.68057

plt <- ggplot() +
#   geom_line(data = DF, aes(x = 1:length(DF$assim), y = assim)) +
#   geom_line(data = DF, aes(x = 1:length(DF$meta), y = meta), colour = "red") +
  geom_line(data = DF, aes(x = length, y = assim),colour = "blue") +
  geom_line(data = DF, aes(x = length, y = meta), colour = "red") +
  geom_function(fun = function(x) 0.0045*(0.0028^0.65)*3.1^(9.64/10)*x^(1.95)*exp(0.02*1.5*x), linetype = "dashed") +
  #geom_function(fun = function(x) 0.001*(0.73 + 0.0076*9.64-0.051) *24*0.7/0.011111, linetype = "dashed") +
  geom_function(fun = function(x)0.001*(0.73 + 0.0076*9.64-0.051) *24*0.75/0.011111 *0.001*x^3/(1+0.001*x^3), linetype = "dashed") +

  theme_minimal() +
  labs(x = "Julian Day", y = "Assimilated Weight (g), Metabolism (g)", title = paste0("Assimilated Weight and metabolism in ", scenario)) + 
  #scale_x_continuous(breaks = seq(1,365*28, by = 30*28)) +
  scale_x_continuous(breaks = seq(1,100, by = 5)) +
  scale_y_continuous(breaks = seq(0, 40, by = 2))

ggsave(paste0("figures/assim_v_meta/all years goldfish.png"), plot = plt, width = 18, height = 20, unit = "cm")

######################################### for filter feeding with constant conditions ########################
#geom_function(fun = function(x) 1.5*0.0045*(0.0028^0.65)*3.1^(9.64/10)*x^(1.95)*exp(0.02*0.8*x), linetype = "dashed") +
#geom_function(fun = function(x) 60*60*0.01*24*0.001*(0.73 + 0.0076*9.64-0.051)*filter*0.8*x*pi*(0.27*x*5*0.001)^2, linetype = "dashed") +