
preds <- fread(paste0("../ForageFishModelRepo/Results/weight_6_partic.csv"))

zs <- preds$assimilated_energy
zs <- t(matrix(zs, nrow = length(unique(preds$light)), ncol = length(unique(preds$abundance))))
#view(zs)
axx <- list(
  title = "Light",
  ticketmode = 'array',
  ticktext = c("1e-6", "1e-5", "1e-4", "1e-3", "1e-2", "1e-1", "1", "10", "100"),
  nticks = 9
  #range = c(0, 100)
)

axy <- list(
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
   #add_trace(data = preds, x = ~light, y = ~abundance, z = ~assimilated_energy, type = "mesh3d", opacity = 0.7, color = "blue")
   add_surface(z = zs, opacity = 0.8)%>% 
   layout(scene = list(xaxis=axx,yaxis=axy,zaxis=axz, aspectmode='auto'))
   #add_surface(x = ~light, y = ~abundance, z = ~assimilated_energy)




saveWidget(fig, "figures/partic_vs_filter/plotPartic1.html")