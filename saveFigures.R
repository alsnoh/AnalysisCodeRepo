

#grid.arrange(grobs = plts, ncol = 2, top = textGrob("Daily QC: Blue",gp=gpar(fontsize=20,font=3)))
ggsave(file = "figures/multiPlotTest3.png", arrangeGrob(grobs = plts, 
                                                    ncol = 2,
                                                  widths = c(1,1),
                                                 heights = c(1,1), 
                                                     top = "yo",
                                                     left = "yo"),
                                                   width = 60, 
                                                  height = 40, 
                                                    unit = "cm")