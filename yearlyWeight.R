#DFWeight <- data.frame(weights = matrix(predsAlex$Weight), jd = matrix(predsAlex$JulianDay), year = matrix(predsAlex$year))
DFLength <- data.frame(lengths = matrix(predsAlex$Length), jd = matrix(predsAlex$JulianDay), year = matrix(predsAlex$year))

#x <- length(DFLength$lengths)
# set parameters for von bertalanffy 
#A <- 0.027 
#n <- 3/4
#W0 <- 0.14
JD1 <- 0
#c <- (W0)^(1-n) / (1-n)  - JD1*A
Lmax <- 33
k <- 0.6/365
L0 <- 10

# for herring
d <- data.frame(x = seq(0,9*365, by = 365), y = c(10.22,19.54,25.07,28.83,30.50,31.56,32.71,32.96,32.89,32.75))


# plt1 <- ggplot(data = DFWeight, aes(x = jd, y = weights, colour = factor(year))) +
#   geom_line() +
#   theme_minimal() +
#   labs(x = "Julian Day", y = "Weight (g)", title = paste0("Weight ", DFWeight$year," in ", scenario), colour = "Year") + 
#   #geom_function(fun = function(x) ((1-n)*(A*(x)+c))^(1/(1-n)), linetype = "dashed") +  # solution to dw/dt = Aw^n
#   #geom_function(fun = function(x) (0.14*exp(A*(x-141))), linetype = "dashed") +
#   #geom_function(fun = function(x) (A*(x-JD1)+W0), linetype = "dashed") +
#   scale_x_continuous(breaks = seq(1,365, by = 30)) +
#   scale_y_continuous(breaks = seq(0, 5.5, by = 0.5))

plt2 <- ggplot(data = DFLength, aes(x = 1:length(DFLength$lengths), y = lengths)) +
  geom_line() +
  theme_minimal() +
  labs(x = "Year since start", y = "Length (cm)", title = paste0("Length ", DFLength$year," in ", scenario), colour = "Year") +   # solution to dL/dt = k(Lmax - L)
  geom_function(fun = function(x) Lmax + (L0-Lmax)*exp(-k*(x-JD1)), linetype = "dashed", colour = "blue") +
  geom_line(data =d, aes(x = x, y = y), colour = "red") +
  scale_x_continuous(breaks = seq(0,365*28, by = 365), labels = function(x) x/365) +
  scale_y_continuous(breaks = seq(1, 100, by = 2))

 

#ggsave(paste0("figures/YearlyWeight/jd ", DFWeight$jd[1], "-", DFWeight$jd[nrow(DFWeight)], " const_all ", scenario," ", DFWeight$year[1], " .png"), plot = plt1, width = 18, height = 20, unit = "cm")
ggsave(paste0("figures/yearlyLength/effectAsymptote/jd ", DFLength$jd[1], "-", DFLength$jd[nrow(DFLength)], " ", scenario," ", " k_1.7_W0_6_A1_1.9.png"), plot = plt2, width = 18, height = 20, unit = "cm")
