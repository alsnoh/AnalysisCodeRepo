
preds <- fread(paste0("../ForageFishModelRepo/Results/light_100_weight_6 partic.csv"))

axx <- list(
  title = "Light",
  type = "log"
  #nticks = 5,
  #range = c(0, 100)
)

axy <- list(
  type = "log",
  title = "Abundance"
 # nticks = 6,
 # range = c(1, 100000)
)

axz <- list(
  title = "Assimilated Energy",
  nticks = 5,
  range = c(0, 10)
)



 fig <- plot_ly() %>%
   layout(scene = list(xaxis = axx, yaxis = axy, zaxis = axz)) %>%
   add_trace(data = preds, x = ~light, y = ~abundance, z = ~assimilated_energy, type = "mesh3d", opacity = 0.5, color = ~assimilated_energy) 
   #add_surface(x = ~light, y = ~abundance, z = ~assimilated_energy)

 #ggsave(fig, file = "testPlotly.png", width = 10, height = 10, units = "cm")


saveWidget(fig, "figures/partic_vs_filter/plotPartic.html")