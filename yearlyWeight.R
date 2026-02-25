DFWeight <- data.frame(weights = matrix(predsAlex$Weight), jd = matrix(predsAlex$JulianDay), year = matrix(predsAlex$year))
DFLength <- data.frame(lengths = matrix(predsAlex$Length), jd = matrix(predsAlex$JulianDay), year = matrix(predsAlex$year))

# set parameters for von bertalanffy 
A <- 0.027 
n <- 3/4
W0 <- 0.14
JD1 <- 0
c <- (W0)^(1-n) / (1-n)  - JD1*A
Lmax <- 18.5
k <- 0.36/365


plt1 <- ggplot(data = DFWeight, aes(x = jd, y = weights, colour = factor(year))) +
  geom_line() +
  theme_minimal() +
  labs(x = "Julian Day", y = "Weight (g)", title = paste0("Weight ", DFWeight$year," in ", scenario), colour = "Year") + 
  #geom_function(fun = function(x) ((1-n)*(A*(x)+c))^(1/(1-n)), linetype = "dashed") +  # solution to dw/dt = Aw^n
  #geom_function(fun = function(x) (0.14*exp(A*(x-141))), linetype = "dashed") +
  #geom_function(fun = function(x) (A*(x-JD1)+W0), linetype = "dashed") +
  scale_x_continuous(breaks = seq(1,365, by = 30)) +
  scale_y_continuous(breaks = seq(0, 5.5, by = 0.5))

plt2 <- ggplot(data = DFLength, aes(x = jd, y = lengths, colour = factor(year))) +
  geom_line() +
  theme_minimal() +
  labs(x = "Julian Day", y = "Length (cm)", title = paste0("Length ", DFLength$year," in ", scenario), colour = "Year") +   # solution to dL/dt = k(Lmax - L)
  geom_function(fun = function(x) Lmax + (4-Lmax)*exp(-k*(x-141)), linetype = "dashed") +
  scale_x_continuous(breaks = seq(1,365, by = 30)) +
  scale_y_continuous(breaks = seq(0, 10, by = 1))

 

ggsave(paste0("figures/YearlyWeight/jd ", DFWeight$jd[1], "-", DFWeight$jd[nrow(DFWeight)], " const_all ", scenario," ", DFWeight$year[1], " .png"), plot = plt1, width = 18, height = 20, unit = "cm")
ggsave(paste0("figures/yearlyLength/jd ", DFWeight$jd[1], "-", DFWeight$jd[nrow(DFWeight)], " const_all ", scenario," ", DFWeight$year[1], " .png"), plot = plt2, width = 18, height = 20, unit = "cm")
