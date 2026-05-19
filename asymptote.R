library(ggplot2)
library(ggpubr) 


asymData <- read.csv("../ForageFishModelRepo/Results/asymInvestigationA1.csv")

p <- ggplot() +
    geom_point(data = asymData, aes(x = assim, y = asymLength)) +
    labs(x = "assimilation efficiency", y = "asymptotic length") +
    theme_classic() +
    theme(
      panel.grid.major.x = element_line(color = "#000000",
                                linewidth = 0.1,
                                linetype = 2),
      legend.position = "bottom",
      axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)
    )

file_name <- paste0("figures/asymInvestigation/ChangingA1.png")

# p <- ggplot() +
#     geom_point(data = asymData, aes(x = metaConst, y = asymLength)) +
#     labs(x = "metabolic constant", y = "asymptotic length") +
#     theme_classic() +
#     theme(
#       panel.grid.major.x = element_line(color = "#000000",
#                                 linewidth = 0.1,
#                                 linetype = 2),
#       legend.position = "bottom",
#       axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0.5)
#     )

# file_name <- paste0("figures/asymInvestigation/ChangingM_FEED.png")

ggsave(file_name, width = 18, height = 12, units = "cm")