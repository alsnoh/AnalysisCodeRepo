

grid.arrange(grobs = plts, ncol = 2,labels = c("(a)", "(b)", "(c)", "(d)"))
ggsave(file = "figures/multiPlot.png", arrangeGrob(grobs = plts, ncol = 2, widths = c(1,1), heights = c(1,1)), width = 40, height = 30, unit = "cm")