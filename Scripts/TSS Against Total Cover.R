#Read in csv data 
coredata <- read.csv("Inputs/coredata.csv")

#Graph 1 code for scatter plot of TSSeq against TC with regression lines for each site class and season 
ggplot(data = coredata, aes(x = n2TC, y = n2mean, color = newgroup, shape = season)) + 
  geom_point(alpha = 0.6) + 
  geom_smooth(method = "lm", se = FALSE, aes(linetype = season, color = newgroup)) + 
  theme_minimal() + 
  labs(
    title = "Relationship between Riparian Total Cover and Total Suspended Sediment across site class and season", subtitle = "December 2020 - December 2023", 
    x = "natural log of % total cover", 
    y = "natural log of TSSeq (mg/L)", 
    color = "Site Class", 
    linetype = "Regression line"
  ) + 
  theme(
    legend.position = "right", 
    legend.title = element_text(size = 14), 
    legend.text = element_text(size = 12), 
    plot.title = element_text(size = 16, face = "bold"), 
    plot.subtitle = element_text(size = 14)
  ) + 
  scale_color_manual(values = c("red3", "chartreuse4", "dodgerblue2")) + 
  scale_linetype_manual(values = c("solid", "dashed"))