lengths <- predsAgnes$Length
weights <- predsAgnes$Weight

#plot(lengths^3, log(weights), xlab = "Weight (kg)", ylab = "Length (cm)", main = paste0("Weight-Length Relationship for ", scenario))
model <- lm(log(weights) ~ I(log(lengths)))
coeff <- exp(1)^coef(model)[1]
expo <- coef(model)[2]
plot(coeff*lengths^expo, weights, xlab = "Length (cm)", ylab = "Weight (kg)", main = paste0("Weight-Length Relationship for ", scenario))